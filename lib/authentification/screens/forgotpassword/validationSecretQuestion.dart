import 'package:diginas_app/authentification/screens/forgotpassword/recoveredPasswordMethods.dart';
import 'package:diginas_app/authentification/widgets/FormWidget.dart';
import 'package:diginas_app/authentification/widgets/buttonWidget.dart';
import 'package:diginas_app/authentification/widgets/titleWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
              "Password ",
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
                    title(context, "Your secret question:"),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      width: 320,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 59, 102, 195),
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                    SizedBox(height: 30),
                    title(context, "Your answer"),
                    SizedBox(height: 30),
                    TextFormWdiget(
                        textinputtype: TextInputType.text,
                        obscure: false,
                        hint: 'Enter your answer here..',
                        icon: Icons.lock,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Enter your answer';
                          } else
                            return null;
                        }),
                    SizedBox(height: 50),
                    button(context, "Next", Color.fromRGBO(46, 98, 212, 1),
                        Colors.white, const RecoveredPasswordMethods()),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
