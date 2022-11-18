import 'package:diginas_app/authentification/widgets/FormWidget.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import '../forgotpassword/forgotPassword.dart';

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
                      const Text(
                        "Sign In",
                        style: TextStyle(
                            color: Color.fromRGBO(46, 98, 212, 1),
                            fontSize: 50,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      Form(
                          key: _loginFormKey,
                          child: Column(
                            children: [
                              TextFormWdiget(
                                textinputtype: TextInputType.text,
                                obscure: false,
                                hint: 'mail',
                                icon: Icons.mail,
                                controller: mailController,
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return 'Email should not be empty';
                                  } else {
                                    return EmailValidator.validate(input)
                                        ? null
                                        : 'Enter a valid email';
                                  }
                                },
                                OnSaved: (value) =>
                                    setState(() => email = value),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormWdiget(
                                textinputtype: TextInputType.text,
                                obscure: true,
                                hint: 'Password',
                                icon: Icons.lock,
                                controller: passwordController,
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return 'Password should not be empty';
                                  }
                                  return null;
                                },
                                OnSaved: (value) =>
                                    setState(() => password = value),
                              )
                            ],
                          )),
                      SizedBox(height: 30),
                      button(context, "Sign in", Color.fromRGBO(46, 98, 212, 1),
                          Colors.white),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          const Text(
                            "Forgot your",
                            style: TextStyle(
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
                              child: const Text(
                                "password?",
                                style: TextStyle(
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
            primary: background,
            onPrimary: Colors.white,
            shadowColor: Color.fromARGB(255, 14, 12, 12),
            elevation: 5,
          ),
          onPressed: () {
            final isValid = _loginFormKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              _loginFormKey.currentState!.save();

              final message = 'Successful login! ';
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
