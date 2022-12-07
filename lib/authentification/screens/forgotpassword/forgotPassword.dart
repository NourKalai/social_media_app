import 'package:diginas_app/authentification/screens/forgotpassword/recoveredPasswordMethods.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/UpWidget.dart';
import '../../widgets/rounded.input.field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  bool isMailCorrect = false;
  bool isPhoneCorrect = false;
  bool isNameCorrect = false;
  final _loginFormKey = GlobalKey<FormState>();
  String email = '';
  String phoneNumber = '';
  String username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      UpWidget( titleText: AppLocalizations.of(context)!.forgotpassword),

      Form(
          key: _loginFormKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 50),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: RoundedInputField(
                obscure: false,
                controller: mailController,
                suffixIcon: Icon(
                  Icons.close,
                  color: isMailCorrect ? Colors.green : Colors.red,
                ),
                onChanged: (value) {
                  setState(() {
                    isMailCorrect = EmailValidator.validate(value);
                  });
                },
                hintText: AppLocalizations.of(context)!.email,
                OnSaved: (value) => setState(() => email = value),
                icon: Icons.email,
                coloricon: isMailCorrect ? Colors.green : Colors.red,
                textinputtype: TextInputType.emailAddress,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: RoundedInputField(
                obscure: false,
                controller: phoneNumberController,
                suffixIcon: Icon(
                  Icons.close,
                  color: isMailCorrect ? Colors.green : Colors.red,
                ),
                onChanged: (value) {
                  if (value!.length < 8)
                    setState(() {
                      isPhoneCorrect = true;
                    });
                },
                hintText: AppLocalizations.of(context)!.phonenumber,
                OnSaved: (value) => setState(() => phoneNumber = value),
                icon: Icons.phone,
                coloricon: isPhoneCorrect ? Colors.green : Colors.red,
                textinputtype: TextInputType.phone,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: RoundedInputField(
                obscure: false,
                controller: userNameController,
                suffixIcon: Icon(
                  Icons.close,
                  color: isNameCorrect ? Colors.green : Colors.red,
                ),
                onChanged: (value) {
                  if (value!.isEmpty)
                    setState(() {
                      isNameCorrect = true;
                    });
                },
                hintText: AppLocalizations.of(context)!.username,
                OnSaved: (value) => setState(() => phoneNumber = value),
                icon: Icons.person,
                coloricon: isNameCorrect ? Colors.green : Colors.red,
                textinputtype: TextInputType.text,
              ),
            ),
          ])),
      SizedBox(height: 50),
      // button(context, "Sign in", Color.fromRGBO(46, 98, 212, 1),
      //     Colors.white),
      button(context, AppLocalizations.of(context)!.next,
          (Color.fromARGB(255, 50, 166, 219)), Colors.white),
    ])
         

            ));
  }

  Container button(
      BuildContext context, String text, Color background, Color colorText) {
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
            final isValid = _loginFormKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecoveredPasswordMethods(
                        phoneNumber: phoneNumber, email: email)),
              );
              _loginFormKey.currentState!.save();

              final message = 'Successful ! ';
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: Text(
            text,
            style: TextStyle(
                color: colorText, fontSize: 17, fontFamily: 'Poppins-Regular'),
          )),
    );
  }
}
