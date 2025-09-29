import 'package:flutter/material.dart';
import 'package:remote/constants/key_codes.dart';
import 'package:remote/core/interfaces/tv_interface.dart';
import 'package:remote/ui/widgets/remote_controls/components/circular_button_component.dart';

class ColorKeys extends StatelessWidget {
  final TVInterface tv;
  const ColorKeys({
    super.key, 
    required this.tv,
  });
  
  Color get iconColor => Colors.white54;
  double get size => 55;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _Red(tv: tv, size: size, iconColor: iconColor),
        _Green(tv: tv, size: size, iconColor: iconColor),
        _Yellow(tv: tv, size: size, iconColor: iconColor),
        _Blue(tv: tv, size: size, iconColor: iconColor),
      ],
    );
  }
}

class _Red extends StatelessWidget {
  const _Red({
    required this.tv,
    required this.size,
    required this.iconColor,
  });

  final TVInterface tv;
  final double size;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return BuildCircularButton(
      icon: Icons.circle,
      onTap: () => tv.sendKey(KeyCodes.KEY_RED),
      tooltip: 'Rojo',
      size: size,
      iconColor: Colors.red,
    );
  }
}

class _Green extends StatelessWidget {
  const _Green({
    required this.tv,
    required this.size,
    required this.iconColor,
  });

  final TVInterface tv;
  final double size;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return BuildCircularButton(
      icon: Icons.circle,
      onTap: () => tv.sendKey(KeyCodes.KEY_GREEN),
      tooltip: 'Verde',
      size: size,
      iconColor: Colors.green,
    );
  }
}

class _Yellow extends StatelessWidget {
  const _Yellow({
    required this.tv,
    required this.size,
    required this.iconColor,
  });

  final TVInterface tv;
  final double size;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return BuildCircularButton(
      icon: Icons.circle,
      onTap: () => tv.sendKey(KeyCodes.KEY_YELLOW),
      tooltip: 'Amarillo',
      size: size,
      iconColor: Colors.yellow,
    );
  }
}

class _Blue extends StatelessWidget {
  const _Blue({
    required this.tv,
    required this.size,
    required this.iconColor,
  });

  final TVInterface tv;
  final double size;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return BuildCircularButton(
      icon: Icons.circle,
      onTap: () => tv.sendKey(KeyCodes.KEY_CYAN),
      tooltip: 'Azul',
      size: size,
      iconColor: Colors.blue,
    );
  }
}
