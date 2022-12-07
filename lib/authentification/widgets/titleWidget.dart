import 'package:flutter/material.dart';

Container titleWidget(BuildContext context, String labelText, Color colortext) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 70),
    child: Text(
      labelText,
      style: TextStyle(
        color: colortext,
        fontSize: 16,
        fontFamily: "Poppins",
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Text title(BuildContext context, String labelText) {
  return Text(
    labelText,
    style: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
    ),
  );
}
