import 'package:diginas_app/authentification/screens/forgotpassword/recoveredPasswordMethods.dart';
import 'package:diginas_app/authentification/widgets/FormWidget.dart';
import 'package:diginas_app/authentification/widgets/buttonWidget.dart';
import 'package:diginas_app/authentification/widgets/titleWidget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();
  String email = '';
  String phoneNumber = '';
  String username = '';

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
          padding: const EdgeInsets.only(top: 20, right: 40, left: 40),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              AppLocalizations.of(context)!.forgotpassword,
              style: TextStyle(
                color: Color.fromARGB(255, 3, 6, 12),
                fontSize: 40,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30),
            Form(
              key: _loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title(
                    context,
                    AppLocalizations.of(context)!.entermail,
                  ),
                  TextFormWdiget(
                    textinputtype: TextInputType.text,
                    obscure: false,
                    hint: AppLocalizations.of(context)!.email,
                    icon: Icons.mail,
                    controller: mailController,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return AppLocalizations.of(context)!.entermail;
                      } else {
                        return EmailValidator.validate(input)
                            ? null
                            : AppLocalizations.of(context)!.entervalidmail;
                      }
                    },
                    OnSaved: (value) => setState(() => email = value),
                  ),
                  SizedBox(height: 30),
                  title(context, AppLocalizations.of(context)!.enterphone),
                  TextFormWdiget(
                    textinputtype: TextInputType.phone,
                    obscure: false,
                    hint: AppLocalizations.of(context)!.phonenumber,
                    icon: Icons.phone,
                    controller: phoneNumberController,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return AppLocalizations.of(context)!.enterphone;
                      } else if (input.length < 8) {
                        return AppLocalizations.of(context)!
                            .entervalidphonenumber;
                      } else {
                        return null;
                      }
                    },
                    OnSaved: (value) => setState(() => phoneNumber = value),
                  ),
                  SizedBox(height: 30),
                  title(context, AppLocalizations.of(context)!.enterusername),
                  TextFormWdiget(
                    textinputtype: TextInputType.text,
                    obscure: false,
                    hint: AppLocalizations.of(context)!.username,
                    icon: Icons.person,
                    controller: userNameController,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return AppLocalizations.of(context)!.enterusername;
                      } else
                        return null;
                    },
                    OnSaved: (value) => setState(() => username = value),
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            // button(context, "Sign in", Color.fromRGBO(46, 98, 212, 1),
            //     Colors.white),
            button(context, AppLocalizations.of(context)!.next,
                Color.fromRGBO(46, 98, 212, 1), Colors.white),
          ]),
        )));
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
                    builder: (context) => const RecoveredPasswordMethods()),
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
