import 'package:diginas_app/authentification/screens/forgotpassword/valid.dart';
import 'package:diginas_app/authentification/screens/forgotpassword/validationMail.dart';
import 'package:diginas_app/authentification/screens/forgotpassword/validationSecretQuestion.dart';
import 'package:diginas_app/authentification/widgets/buttonWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/UpWidget.dart';
import '../sign in/login.screen.dart';

class RecoveredPasswordMethods extends StatelessWidget {
  String phoneNumber;
  String email;

  RecoveredPasswordMethods({required this.phoneNumber, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          UpWidget(titleText: AppLocalizations.of(context)!.forgotpassword,),
          SizedBox(height: 50),
          buttonWidget(
            context,
            "Secret Question",
            Color.fromARGB(190, 235, 231, 231),
            Colors.black,
            const ValidationSecretQuestion(),
          ),
          SizedBox(
            height: 20,
          ),
          buttonWidget(
              context,
              "Verification code via SMS",
              Color.fromARGB(190, 235, 231, 231),
              Colors.black,
              // ValidationCode(phoneNumber: phoneNumber)
              Verificatoin(phoneNumber: phoneNumber)),
          SizedBox(
            height: 20,
          ),
          buttonWidget(
              context,
              "Verification code via Mail",
              Color.fromARGB(190, 235, 231, 231),
              Colors.black,
              VerificationMail(mail: email)),
          SizedBox(height: 50),
          button(context, Colors.blue, Colors.white)
        ]),
      ),
    );
  }

  Container button(BuildContext context, Color background, Color colorText) {
    return Container(
        width: 320,
        height: 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              primary: background,
              onPrimary: Colors.white,
              shadowColor: Color.fromARGB(255, 14, 12, 12),
              elevation: 5,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: Text("Return to login")));
  }
}
