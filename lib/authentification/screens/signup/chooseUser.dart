import 'package:diginas_app/authentification/widgets/cadre.dart';
import 'package:flutter/material.dart';


import '../../widgets/UpWidget.dart';

class ChooseAccount extends StatefulWidget {
  const ChooseAccount({Key? key}) : super(key: key);

  @override
  State<ChooseAccount> createState() => _ChooseAccountState();
}

class _ChooseAccountState extends State<ChooseAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 196, 215, 233),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpWidget(
              titleText: 'Choose your account',
            ),
            SizedBox(height: 30, width: 20),
            Cadre(
              title: "Challenger",
              message:
                  'You can join challenges and gain money whenever you win',
            ),
            Cadre(
              title: "Buisness",
              message: 'you can create challenges and make ads',
            ),
          ],
        ),
      ),
    );
  }
}
