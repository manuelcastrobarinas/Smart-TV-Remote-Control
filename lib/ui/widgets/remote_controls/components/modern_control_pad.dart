import 'package:flutter/material.dart';
import 'package:remote/core/interfaces/tv_interface.dart';
import 'package:remote/constants/key_codes.dart';
import 'package:remote/ui/widgets/remote_controls/components/additional_control_button_component.dart';
import 'package:remote/ui/widgets/remote_controls/components/controller_button.dart';

import 'circular_button_component.dart';

class ModernControlPad extends StatelessWidget {
  final TVInterface tv;
  final bool keypadShown;
  final void Function() toggleKeypad;


  const ModernControlPad({
    super.key,
    required this.keypadShown,
    required this.tv,
    required this.toggleKeypad,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Calcular tamaños responsivos
    final controlHeight = screenHeight * 0.25; // 25% de la altura de pantalla
    final buttonSize = screenWidth * 0.08; // 8% del ancho de pantalla
    final spacing = screenWidth * 0.02; // 2% del ancho de pantalla
    
    return Container(
      child: Row(
        children: [
          // Control de volumen
          _buildVolumeControl(controlHeight, buttonSize),
          SizedBox(width: spacing),
          Expanded(
            flex: 2,
            child: _buildCentralControls(
              keypadShown: keypadShown,
              buttonSize: buttonSize,
              spacing: spacing,
            ),
          ),
          SizedBox(width: spacing),
          _buildChannelControl(controlHeight, buttonSize),
        ],
      ),
    );
  }

  Widget _buildVolumeControl(double height, double buttonSize) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.05, 
        horizontal: height * 0.05,
      ),
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(height * 0.5),
      ),
      child: Column(
        children: [
          _buildControlButton(
            icon: Icons.add,
            onTap: () => tv.sendKey(KeyCodes.KEY_VOLUP),
            size: buttonSize,
          ),
          const Spacer(),
          BuildCircularButton(
            size: buttonSize * 0.8,
            icon: Icons.volume_off,
            onTap: () => tv.sendKey(KeyCodes.KEY_MUTE),
            tooltip: 'Silenciar',
          ),
          const Spacer(),
          _buildControlButton(
            icon: Icons.remove,
            onTap: () => tv.sendKey(KeyCodes.KEY_VOLDOWN),
            size: buttonSize,
          ),
        ],
      ),
    );
  }

  Widget _buildChannelControl(double height, double buttonSize) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(
        vertical: height * 0.05, 
        horizontal: height * 0.05,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(height * 0.5),
      ),
      child: Column(
        children: [
          _buildControlButton(
            icon: Icons.keyboard_arrow_up,
            onTap: () => tv.sendKey(KeyCodes.KEY_CHUP),
            size: buttonSize,
          ),
          const Spacer(),
          Text(
            'CH',
            style: TextStyle(
              color: Colors.white,
              fontSize: height * 0.08,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          _buildControlButton(
            icon: Icons.keyboard_arrow_down,
            onTap: () => tv.sendKey(KeyCodes.KEY_CHDOWN),
            size: buttonSize,
          ),
        ],
      ),
    );
  }

 
  Widget _buildCentralControls({
    required bool keypadShown,
    required double buttonSize,
    required double spacing,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: spacing * 2, 
        horizontal: spacing,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AdditionalControlButtonComponent(
                  label: 'Home',
                  icon: Icons.home,
                  onTap: () async => await tv.sendKey(KeyCodes.KEY_HOME),
                ),
                SizedBox(height: spacing),
                ControllerButton(
                  borderRadius: 10,
                  child: Icon(Icons.arrow_left, size: 24, color: Colors.white),
                  onPressed: () => tv.sendKey(KeyCodes.KEY_LEFT),
                ),
                SizedBox(height: spacing),
                AdditionalControlButtonComponent(
                  label: 'Back',
                  icon: Icons.arrow_back,
                  onTap: () async => await tv.sendKey(KeyCodes.KEY_RETURN),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ControllerButton(
                  borderRadius: 10,
                  child: Icon(Icons.arrow_drop_up, size: 24, color: Colors.white),
                  onPressed: () async => await tv.sendKey(KeyCodes.KEY_UP),
                ),
                SizedBox(height: spacing),
                ControllerButton(
                  child: const Text("OK", style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500)),
                  onPressed: () async => await tv.sendKey(KeyCodes.KEY_ENTER),
                ),
                SizedBox(height: spacing),
                ControllerButton(
                  borderRadius: 10,
                  child: Icon(Icons.arrow_drop_down, size: 24, color: Colors.white),
                  onPressed: () async => await tv.sendKey(KeyCodes.KEY_DOWN),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AdditionalControlButtonComponent(
                  label: 'Input',
                  icon: Icons.input,
                  onTap: () async => await tv.sendKey(KeyCodes.KEY_SOURCE), 
                ),
                SizedBox(height: spacing),
                ControllerButton(
                  borderRadius: 10,
                  child: Icon(Icons.arrow_right, size: 24, color: Colors.white),
                  onPressed: () => tv.sendKey(KeyCodes.KEY_RIGHT),
                ),
                SizedBox(height: spacing),
                AdditionalControlButtonComponent(
                  label: 'Exit',
                  icon: Icons.exit_to_app_rounded,
                  onTap: () async => await tv.sendKey(KeyCodes.KEY_EXT41), 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onTap,
    required double size,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(size * 0.5),
          border: Border.all(
            color: const Color(0xFF3A3A3C),
            width: 0.5,
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: size * 0.5,
        ),
      ),
    );
  }
}