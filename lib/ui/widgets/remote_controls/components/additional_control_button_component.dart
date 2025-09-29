import 'package:flutter/material.dart';

 class AdditionalControlButtonComponent extends StatelessWidget {
   
   final String label;
   final IconData icon;
   final VoidCallback onTap;
   final double? borderRadius;
   final Color? backgroundColor;
   
   const AdditionalControlButtonComponent({
    super.key, 
    required this.label,
    required this.icon,
    required this.onTap,
    this.borderRadius,
    this.backgroundColor,
   });
 
   @override
   Widget build(BuildContext context) {
     return MaterialButton(
      padding   : const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color     : backgroundColor ?? const Color(0xFF1C1C1E),
      onPressed : onTap,
      shape     : RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        side: const BorderSide(
          color : Color(0xFF3A3A3C),
          width : 0.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,color: Colors.white,size: 24),
          const SizedBox(height: 4),
          Text(label,style: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)
        ],
      ),
    );
   }
 }
