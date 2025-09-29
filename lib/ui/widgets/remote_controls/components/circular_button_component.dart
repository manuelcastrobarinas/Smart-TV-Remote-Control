import 'package:flutter/material.dart';

class BuildCircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String? tooltip;
  final double? size;
  final Color? iconColor;

  const BuildCircularButton({
    super.key,
    required this.icon, 
    required this.onTap, 
    required this.tooltip,
    this.size = 65,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width : size,
      height: size,
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: const Color(0xFF2C2C2E),
          shape: CircleBorder(),
        ),
        tooltip: tooltip ?? '',
        onPressed: onTap,
        icon: Icon(icon,color: iconColor,size: 20),
      ),
    );
  }
}