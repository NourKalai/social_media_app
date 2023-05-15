import 'package:flutter/material.dart';

Container titleWidget(BuildContext context, String labelText, Color colortext) {
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
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
    style: const TextStyle(
      color: Color.fromARGB(255, 11, 145, 82),
      fontSize: 14,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
    ),
  );
}
