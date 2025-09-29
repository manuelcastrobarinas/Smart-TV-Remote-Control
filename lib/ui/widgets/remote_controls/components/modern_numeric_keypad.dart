import 'package:flutter/material.dart';
import 'package:remote/core/interfaces/tv_interface.dart';
import 'package:remote/constants/key_codes.dart';

class ModernNumericKeypad extends StatelessWidget {
  final TVInterface tv;

  const ModernNumericKeypad({
    super.key,
    required this.tv,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Teclado numérico 5x3
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1C1C1E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildKeypadRow(['1', '2', '3']),
                const SizedBox(height: 12),
                _buildKeypadRow(['4', '5', '6']),
                const SizedBox(height: 12),
                _buildKeypadRow(['7', '8', '9']),
                const SizedBox(height: 12),
                _buildKeypadRow(['TV', '0', 'Menu']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeypadRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((key) => _buildKeypadButton(key)).toList(),
    );
  }

  Widget _buildKeypadButton(String text) {
    return GestureDetector(
      onTap: () => _handleKeyPress(text),
      child: Container(
        width: 60,
        height: 45,
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFF3A3A3C),
            width: 0.5,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: text == 'TV' || text == 'Menu' ? 12 : 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void _handleKeyPress(String key) {
    switch (key) {
      case '1':
        tv.sendKey(KeyCodes.KEY_1);
        break;
      case '2':
        tv.sendKey(KeyCodes.KEY_2);
        break;
      case '3':
        tv.sendKey(KeyCodes.KEY_3);
        break;
      case '4':
        tv.sendKey(KeyCodes.KEY_4);
        break;
      case '5':
        tv.sendKey(KeyCodes.KEY_5);
        break;
      case '6':
        tv.sendKey(KeyCodes.KEY_6);
        break;
      case '7':
        tv.sendKey(KeyCodes.KEY_7);
        break;
      case '8':
        tv.sendKey(KeyCodes.KEY_8);
        break;
      case '9':
        tv.sendKey(KeyCodes.KEY_9);
        break;
      case '0':
        tv.sendKey(KeyCodes.KEY_0);
        break;
      case 'TV':
        tv.sendKey(KeyCodes.KEY_TV);
        break;
      case 'Menu':
        tv.sendKey(KeyCodes.KEY_MENU);
        break;
      case 'Delete':
        tv.sendKey(KeyCodes.KEY_CLEAR);
        break;
      case 'OK':
        tv.sendKey(KeyCodes.KEY_ENTER);
        break;
      case 'BACK':
        tv.sendKey(KeyCodes.KEY_RETURN);
        break;
      case 'CLEAR':
        tv.sendKey(KeyCodes.KEY_ADDDEL);
        tv.sendKey(KeyCodes.KEY_CLEAR);
        break;
    }
  }
}

