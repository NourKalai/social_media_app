import 'package:diginas_app/authentification/screens/forgotpassword/valid.dart';
import 'package:diginas_app/authentification/screens/forgotpassword/validation_mail.dart';
import 'package:diginas_app/authentification/screens/forgotpassword/validation_secret_question.dart';
import 'package:diginas_app/authentification/widgets/button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'package:flutter/material.dart';

import '../../widgets/up_widget.dart';
import '../sign in/login_screen.dart';

class RecoveredPasswordMethods extends StatelessWidget {
  final String phoneNumber;
  final String email;

const RecoveredPasswordMethods({super.key, required this.phoneNumber, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          UpWidget(titleText: AppLocalizations.of(context)!.forgotpassword,),
          const SizedBox(height: 50),
          buttonWidget(
            context,
            "Secret Question",
            const Color.fromARGB(190, 235, 231, 231),
            Colors.black,
            const ValidationSecretQuestion(),
          ),
          const  SizedBox(
            height: 20,
          ),
          buttonWidget(
              context,
              "Verification code via SMS",
              const  Color.fromARGB(190, 235, 231, 231),
                Colors.black,
              // ValidationCode(phoneNumber: phoneNumber)
              Verificatoin(phoneNumber: phoneNumber)
              ),
        const  SizedBox(
            height: 20,
          ),
          buttonWidget(
              context,
              "Verification code via Mail",
             const Color.fromARGB(190, 235, 231, 231),
              Colors.black,
              VerificationMail(mail: email)),
         const   SizedBox(height: 50),
          button(context, Colors.blue, Colors.white)
        ]),
      ),
    );
  }

  Container button(BuildContext context, Color background, Color colorText) {
    // ignore: sized_box_for_whitespace
    return Container(
        width: 320,
        height: 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: background,
              foregroundColor: Colors.white,
              shadowColor: const Color.fromARGB(255, 14, 12, 12),
              elevation: 5,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text("Return to login")));
  }
}
