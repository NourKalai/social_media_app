import 'package:flutter/material.dart';

Text titleWidget(BuildContext context, String labelText, Color colortext) {
  return Text(
    labelText,
    style: TextStyle(
      color: colortext,
      fontSize: 16,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
    ),
  );
}

Text title(BuildContext context, String labelText) {
  return Text(
    labelText,
    style: TextStyle(
      color: Color.fromRGBO(46, 98, 212, 1),
      fontSize: 14,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
    ),
  );
}
