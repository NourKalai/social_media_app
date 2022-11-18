
import 'package:diginas_app/authentification/screens/forgotpassword/validationCode.dart';
import 'package:diginas_app/authentification/screens/forgotpassword/validationSecretQuestion.dart';
import 'package:diginas_app/authentification/widgets/buttonWidget.dart';
import 'package:diginas_app/authentification/widgets/titleWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecoveredPasswordMethods extends StatelessWidget {
  const RecoveredPasswordMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30, right: 40, left: 40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          Container(
            child: titleWidget(context, "Have you forgot your password ?",
                Color.fromARGB(255, 13, 14, 17)),
          ),
          titleWidget(
            context,
            "No problem , choose one way to  recover you account ",
            Color.fromARGB(255, 29, 175, 49),
          ),
          SizedBox(
            height: 40,
          ),
          button(
            context,
            "Secret Question",
            Color.fromARGB(190, 235, 231, 231),
            Colors.black,
            const ValidationSecretQuestion(),
          ),
          SizedBox(
            height: 20,
          ),
          button(
              context,
              "Verification code via SMS",
              Color.fromARGB(190, 235, 231, 231),
              Colors.black,
              ValidationCode()),
          SizedBox(
            height: 20,
          ),
          button(
              context,
              "Verification code via Mail",
              Color.fromARGB(190, 235, 231, 231),
              Colors.black,
              const ValidationCode()),
        ]),
      )),
    );
  }
}
