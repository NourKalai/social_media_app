// ignore: file_names
import 'package:diginas_app/authentification/screens/sign%20in/login_screen.dart';
import 'package:diginas_app/authentification/widgets/form_widget.dart';
import 'package:diginas_app/authentification/widgets/button_widget.dart';
import 'package:diginas_app/authentification/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ValidationSecretQuestion extends StatefulWidget {
  const ValidationSecretQuestion({Key? key}) : super(key: key);

  @override
  State<ValidationSecretQuestion> createState() =>
      _ValidationSecretQuestionState();
}

class _ValidationSecretQuestionState extends State<ValidationSecretQuestion> {
  final _loginFormKey = GlobalKey<FormState>();

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
        padding: const EdgeInsets.only(top: 30, right: 60, left: 40),
        child: Column(
          children: [
            const Text(
              "Forgot ",
              style: TextStyle(
                color: Color.fromARGB(255, 3, 6, 12),
                fontSize: 40,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Password ",
              style: TextStyle(
                color: Color.fromARGB(255, 3, 6, 12),
                fontSize: 40,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Form(
                key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title(context, "Your secret question:"),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      width: 320,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 59, 102, 195),
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.info,
                              color: Color.fromARGB(255, 27, 76, 148),
                              size: 30,
                            ),
                            Text(
                              ' your secret question',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 9, 10, 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    title(context, "Your answer"),
                    const SizedBox(height: 30),
                    TextFormWdiget(
                        textinputtype: TextInputType.text,
                        obscure: false,
                        hint: 'Enter your answer here..',
                        icon: Icons.lock,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Enter your answer';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(height: 50),
                    buttonWidget(
                        context,
                        "Next",
                        const Color.fromRGBO(46, 98, 212, 1),
                        Colors.white,
                        const LoginPage()),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
