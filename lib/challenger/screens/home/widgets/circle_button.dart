
import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  final Color? backgroundcolor;

  const CircleButton(
      {super.key,
      required this.icon,
      this.backgroundcolor = const Color.fromARGB(255, 144, 183, 214),
      this.color = Colors.white,
      required this.onPressed});

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.backgroundcolor,
      ),
      child: IconButton(
        icon: Icon(
          widget.icon,
          color: widget.color,
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
