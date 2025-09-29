import 'package:flutter/material.dart';

class ControllerButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color color;

  const ControllerButton({
    super.key,
    this.child,
    this.onPressed,
    this.borderRadius = 50,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: const Color(0XFF2e2e2e),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [Color(0XFF1c1c1c), Color(0XFF383838)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              colors: [Color(0XFF303030), Color(0XFF1a1a1a)]
            ),
          ),
          child: onPressed == null
            ? child
            : MaterialButton(
                color: color,
                minWidth: 0,
                onPressed: onPressed,
                shape: const CircleBorder(),
                child: child,
              ),
        ),
      ),
    );
  }
}


class ControllerButtonModern extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color color;

  const ControllerButtonModern({
    super.key,
    this.child,
    this.onPressed,
    this.borderRadius = 50,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: const [

        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
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
          child: onPressed == null
            ? child
            : MaterialButton(
              color: color,
              minWidth: 0,
              onPressed: onPressed,
              child: child,
            ),
        ),
      ),
    );
  }
}