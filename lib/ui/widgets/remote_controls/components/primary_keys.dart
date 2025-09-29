import 'package:flutter/material.dart';
import 'package:remote/implementations/samsung_tv.dart';

class PrimaryKeys extends StatelessWidget {
  
  final void Function() onChangeDesing;
  final void Function() toggleKeypad;
  final Future<void> Function() handlePowerButton;
  final bool keypadShown;
  final bool isConnecting;
  final String connectionStatus;
  final SamsungTV tv;
  const PrimaryKeys({
    super.key,
    required this.onChangeDesing,
    required this.toggleKeypad,
    required this.handlePowerButton,
    required this.keypadShown,
    required this.isConnecting,
    required this.connectionStatus,
    required this.tv
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(
            Icons.change_circle_outlined,
            size: 30,
            color: isConnecting ? Colors.grey : Colors.cyan,
          ),
          onPressed: isConnecting ? null : onChangeDesing,
          tooltip: 'Conectar TV',
        ),
        IconButton(
          icon: Icon(Icons.dialpad, size: 30, color: keypadShown ? Colors.blue : Colors.white70),
          onPressed: toggleKeypad,
          tooltip: 'Teclado numérico',
        ),
        IconButton(
          icon: const Icon(Icons.power_settings_new, color: Colors.red, size: 30),
          onPressed: handlePowerButton,
          tooltip: 'Encender/Apagar TV',
        ),
      ],
    );
  }
}
