import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ValidationCode extends StatefulWidget {
  const ValidationCode({Key? key}) : super(key: key);

  @override
  State<ValidationCode> createState() => _ValidationCodeState();
}

class _ValidationCodeState extends State<ValidationCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30, right: 40, left: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Forgot ",
              style: TextStyle(
                color: Color.fromARGB(255, 3, 6, 12),
                fontSize: 40,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Password",
              style: TextStyle(
                color: Color.fromARGB(255, 3, 6, 12),
                fontSize: 40,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}
