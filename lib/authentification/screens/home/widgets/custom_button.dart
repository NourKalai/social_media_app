import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onTap,
    this.color = Colors.green,
    required this.text,
    this.colorBorder,
    this.textColor,
    this.height = 60,
    Key? key,
  }) : super(key: key);
  String? text;
  Color? color;
  Function() onTap;
  Color? colorBorder;
  Color? textColor;
  double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          border: colorBorder == null
              ? null
              : Border.all(color: colorBorder!, width: 2),
        ),
        child: Text(
          text!,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w100,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
