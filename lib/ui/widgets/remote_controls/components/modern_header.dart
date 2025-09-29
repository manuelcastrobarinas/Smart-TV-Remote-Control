import 'package:flutter/material.dart';
import 'package:remote/core/interfaces/tv_interface.dart';

class ModernHeader extends StatelessWidget implements PreferredSizeWidget {
  final TVInterface tv;
  final String connectionStatus;
  final Color connectionColor;
  final IconData connectionIcon;
  final VoidCallback onBackPressed;
  final VoidCallback onRefreshPressed;
  final VoidCallback onPowerPressed;

  const ModernHeader({
    super.key,
    required this.tv,
    required this.connectionStatus,
    required this.connectionColor,
    required this.connectionIcon,
    required this.onBackPressed,
    required this.onRefreshPressed,
    required this.onPowerPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF2C2C2E),
            width: 0.5,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {
                  // TODO: Implementar configuración
                },
                tooltip: 'Configuración',
              ),
              const SizedBox(width: 8),
              
              // Título y selector de TV
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        tv.deviceName ?? 'Choose a TV',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                   
                    const SizedBox(width: 6),
                    
                    // Estado de conexión
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: connectionColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: connectionColor, width: 1),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(connectionIcon,size: 14, color: connectionColor),
                            const SizedBox(width: 3),
                            Flexible(
                              child: Text(
                                connectionStatus,
                                style: TextStyle(
                                  color: connectionColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Botón de encendido/apagado
              IconButton(
                icon: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.power_settings_new,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                onPressed: onPowerPressed,
                tooltip: 'Encender/Apagar TV',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);
}

