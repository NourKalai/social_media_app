import 'package:diginas_app/constant/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CircleButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const CircleButton({super.key, required this.icon, required this.onPressed});

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
        color: Colors.blue.shade200,
      ),
      child: Icon(widget.icon, color: Colors.white),
    );
  }
}
