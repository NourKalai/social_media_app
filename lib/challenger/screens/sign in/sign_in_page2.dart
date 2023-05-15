import 'package:diginas_app/challenger/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../forgotpassword/forgot_password.dart';

class SignInPage2 extends StatefulWidget {
  const SignInPage2({Key? key}) : super(key: key);

  @override
  State<SignInPage2> createState() => _SignInPage2State();
}

class _SignInPage2State extends State<SignInPage2> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/image 82.png',
                        width: 200,
                      ),
                      const SizedBox(height: 35),
                      Text(
                        AppLocalizations.of(context)!.signin,
                        style: const TextStyle(
                            color: Color.fromRGBO(46, 98, 212, 1),
                            fontSize: 40,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      Form(
                          key: _loginFormKey,
                          child: Column(
                            children: [
                              TextFormWdiget(
                                textinputtype: TextInputType.text,
                                obscure: false,
                                hint: AppLocalizations.of(context)!.email,
                                icon: Icons.mail,
                                controller: mailController,
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .entermail;
                                  } else {
                                    return EmailValidator.validate(input)
                                        ? null
                                        : AppLocalizations.of(context)!
                                            .entervalidmail;
                                  }
                                },
                                onSaved: (value) =>
                                    setState(() => email = value),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormWdiget(
                                textinputtype: TextInputType.text,
                                obscure: true,
                                hint: AppLocalizations.of(context)!.password,
                                icon: Icons.lock,
                                controller: passwordController,
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .enterpassword;
                                  }
                                  return null;
                                },
                                onSaved: (value) =>
                                    setState(() => password = value),
                              )
                            ],
                          )),
                      const SizedBox(height: 30),
                      button(context, AppLocalizations.of(context)!.signin,
                          const Color.fromRGBO(46, 98, 212, 1), Colors.white),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.forgotyour,
                            style: const TextStyle(
                                fontFamily: 'Poppins-Regular', fontSize: 16),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPassword()),
                                );
                              },
                              child: Text(
                                "${AppLocalizations.of(context)!.password}?",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 8, 18, 41),
                                    fontSize: 16),
                              ))
                        ],
                      )
                    ],
                  )
                ],
              )),
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
            backgroundColor: background,
            foregroundColor: Colors.white,
            shadowColor: const Color.fromARGB(255, 14, 12, 12),
            elevation: 5,
          ),
          onPressed: () {
            final isValid = _loginFormKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              _loginFormKey.currentState!.save();

              const message = 'Successful login! ';
            const snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => const SignInPage2()),
          //   );
          // },
          child: Text(
            text,
            style: TextStyle(
                color: colorText, fontSize: 17, fontFamily: 'Poppins-Regular'),
          )),
    );
  }
}
