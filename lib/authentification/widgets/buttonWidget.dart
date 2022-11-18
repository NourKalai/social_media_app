import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container button(BuildContext context, String text, Color background,
    Color colorText, func) {
  return Container(
    width: 320,
    height: 60,
    child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(background),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return Color.fromARGB(255, 122, 255, 82); //<-- SEE HERE

              return null;
            },
          ),
        ),
        onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => func),
              )
            },
        child: Text(
          text,
          style: TextStyle(
              color: colorText, fontSize: 17, fontFamily: 'Poppins-Regular'),
        )),
  );


  
}
