import 'dart:developer';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:remote/constants/key_codes.dart';
import 'package:remote/core/models/disconnection_type.dart';
import 'package:remote/implementations/samsung_tv.dart';
import 'package:remote/ui/screens/device_selection/device_selection_screen.dart';
import 'package:remote/ui/widgets/remote_controls/components/components.dart';

class RemoteScreen extends StatefulWidget {
  final SamsungTV? selectedDevice;
  
  const RemoteScreen({super.key, this.selectedDevice});

  @override
  State<RemoteScreen> createState() => _RemoteScreenState();
}

class _RemoteScreenState extends State<RemoteScreen> {
  SamsungTV tv = SamsungTV();
  bool _keypadShown = false;
  bool _isConnecting = false;
  String _connectionStatus = 'No conectado';

  @override
  void initState() {
    super.initState();
    if (widget.selectedDevice != null) {
      tv = widget.selectedDevice!;
      // Configurar callback de desconexión
      tv.setOnDisconnectedCallback(_handleDisconnection);
      
      // Si el dispositivo ya está conectado, actualizar el estado
      if (tv.isConnected) {
        setState(() {
          _connectionStatus = 'Conectado';
          _isConnecting = false;
        });
      } else {
        _connectToSelectedDevice();
      }
    }
  }


  Future<void> _connectToSelectedDevice() async {
    log('_connectToSelectedDevice called - attempting reconnection...');
    setState(() {
      _isConnecting = true;
      _connectionStatus = 'Conectando a la TV...';
    });

    try {
      // Configurar callback de desconexión antes de conectar
      tv.setOnDisconnectedCallback(_handleDisconnection);
      
      // Try to connect directly
      await tv.connect();
      
      setState(() {
        _connectionStatus = 'Conectado';
        _isConnecting = false;
      });
      
      log('Reconnection successful - TV is now connected');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('¡Reconectado exitosamente a ${tv.deviceName ?? 'la TV Samsung'}! El TV se ha encendido automáticamente.'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } catch (e) {
      log('Reconnection failed: $e');
      setState(() {
        _isConnecting = false;
        _connectionStatus = 'Error de conexión';
      });
      
      if (mounted) {
        // Check if it's a connection refused error (TV is off)
        if (e.toString().contains('Connection refused') || 
            e.toString().contains('errno = 111')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('El TV está apagado. Por favor, enciéndelo manualmente y vuelve a intentar.'),
              backgroundColor: Colors.orange,
              duration: const Duration(seconds: 5),
              action: SnackBarAction(
                label: 'Reintentar',
                textColor: Colors.white,
                onPressed: _connectToSelectedDevice,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al reconectar: ${e.toString()}'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 5),
              action: SnackBarAction(
                label: 'Reintentar',
                textColor: Colors.white,
                onPressed: _connectToSelectedDevice,
              ),
            ),
          );
        }
      }
    }
  }

  Future<void> connectTV() async {
    setState(() {
      _isConnecting = true;
      _connectionStatus = 'Buscando TVs Samsung...';
    });

    try {
      tv = await SamsungTV.discover();
      setState(() {
        _connectionStatus = 'Conectando a la TV...';
      });
      
      await tv.connect();
      
      setState(() {
        _connectionStatus = 'Conectado';
        _isConnecting = false;
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('¡Conectado exitosamente a la TV Samsung!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isConnecting = false;
        _connectionStatus = 'Error de conexión';
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
            action: SnackBarAction(
              label: 'Reintentar',
              textColor: Colors.white,
              onPressed: connectTV,
            ),
          ),
        );
      }
    }
    
    log("this is the token to save somewere ${tv.token}");
  }

  void toggleKeypad() => setState(() => _keypadShown = ! _keypadShown);

  Future<void> _handlePowerButton() async {
    log('Power button pressed - turning off TV and redirecting...');
    
    try {
      // Send the power command
      await tv.sendKey(KeyCodes.KEY_POWER);
      log('Power command sent successfully');
      
      // Wait a moment for the command to be sent
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Close connection immediately
      tv.disconnect();
      log('Connection closed after power command');
      
      // Redirect immediately
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DeviceSelectionScreen(),
          ),
        );
      }
      
    } catch (e) {
      log('Error sending power command: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al enviar comando: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }
  void _handleDisconnection(DisconnectionType disconnectionType) {
    log('_handleDisconnection called in UI with type: $disconnectionType');
    log('Widget mounted: $mounted');
    log('Currently connecting: $_isConnecting');
    
    if (mounted) {
      // Si estamos en proceso de reconexión, no mostrar alertas
      if (_isConnecting) {
        log('Currently reconnecting, ignoring disconnection event');
        return;
      }
      
      log('Handling disconnection in UI: $disconnectionType');
      setState(() {
        _connectionStatus = 'Desconectado';
        _isConnecting = false;
      });
      
      if (disconnectionType == DisconnectionType.wifiDisconnected) {
        // WiFi desconectado - mostrar alerta inmediata
        log('Showing WiFi disconnection alert');
        _showWifiDisconnectionAlert();
      } else {
        // Otras desconexiones - redirigir directamente
        log('Redirecting to device selection screen');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DeviceSelectionScreen(),
          ),
        );
      }
    } else {
      log('Widget not mounted, cannot handle disconnection');
    }
  }

  void _showWifiDisconnectionAlert() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('WiFi desconectado - Verifica tu conexión a internet'),
        backgroundColor: Colors.orange,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Reconectar',
          textColor: Colors.white,
          onPressed: _connectToSelectedDevice,
        ),
      ),
    );
    
    // Navegar inmediatamente a selección de dispositivos
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DeviceSelectionScreen(),
          ),
        );
      }
    });
  }

  Color _getConnectionColor() {
    if (_isConnecting) return Colors.blue;
    if (_connectionStatus == 'Conectado') return Colors.green;
    if (_connectionStatus == 'Error de conexión') return Colors.red;
    if (_connectionStatus == 'Desconectado') return Colors.orange;
    return Colors.grey;
  }

  IconData _getConnectionIcon() {
    if (_isConnecting) return Icons.sync;
    if (_connectionStatus == 'Conectado') return Icons.check_circle;
    if (_connectionStatus == 'Error de conexión') return Icons.error;
    if (_connectionStatus == 'Desconectado') return Icons.wifi_off;
    return Icons.cast_connected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: ModernHeader(
        tv: tv,
        connectionStatus: _connectionStatus,
        connectionColor: _getConnectionColor(),
        connectionIcon: _getConnectionIcon(),
        onBackPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const DeviceSelectionScreen(),
            ),
          );
        },
        onRefreshPressed: _connectToSelectedDevice,
        onPowerPressed: _handlePowerButton,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StreamingAppsSection(tv: tv), //TODO: HACER LA PARTE DE STREAMING PARA QUITAR APLICACIONES Y AÑADIRLAS Y QUE REIRIJA A DICHA APLICACION SI ESTA EN EL TV
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: PrimaryKeys(
                  onChangeDesing    : () => Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceSelectionScreen())),
                  toggleKeypad      : toggleKeypad,
                  handlePowerButton : _handlePowerButton,
                  keypadShown       : _keypadShown,
                  isConnecting      : _isConnecting,
                  connectionStatus  : _connectionStatus,
                  tv: tv,
                ),
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: _keypadShown,
                child: ModernNumericKeypad(tv: tv),
              ),
              Visibility(
                visible: _keypadShown,
                child: const SizedBox(height: 20)
              ),
              // Panel de control
              ModernControlPad(tv: tv, keypadShown: _keypadShown, toggleKeypad: toggleKeypad),
              const Spacer(),
              _AdditionalControlButtons(
                tv: tv,
                connectToSelectedDevice: _connectToSelectedDevice
              ),
            ],
          ),
        ),
      ),
    );
  }

}


class _AdditionalControlButtons extends StatelessWidget {
  
  final SamsungTV tv;
  final Function() connectToSelectedDevice;

  const _AdditionalControlButtons({
    required this.tv,
    required this.connectToSelectedDevice
  });

  Widget _buildAdditionalControlButton(String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF3A3A3C),
            width: 0.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showColorControls({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1C1C1E),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Controles de Color',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ColorKeys(tv: tv),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showMediaControls({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1C1C1E),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Controles de Medios',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            MediaControls(tv: tv),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showSettings({required BuildContext context, required Function() connectToSelectedDevice}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1C1C1E),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Configuración',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.refresh, color: Colors.white),
              title: Text('Reconectar TV', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                connectToSelectedDevice();
              },
            ),
            ListTile(
              leading: Icon(Icons.devices, color: Colors.white),
              title: Text('Cambiar Dispositivo', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeviceSelectionScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Botón para mostrar controles de color
        _buildAdditionalControlButton('Colores', Icons.palette, () => _showColorControls(context: context)),  
        // Botón para controles de medios
        _buildAdditionalControlButton('Medios', Icons.play_circle_fill, () => _showMediaControls(context: context)),
        // Botón para configuración
        _buildAdditionalControlButton('Config', Icons.settings, () => _showSettings(context: context, connectToSelectedDevice: connectToSelectedDevice)),
      ],
    );
  }
}

