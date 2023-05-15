import 'package:diginas_app/challenger/screens/home/home_screen.dart';
import 'package:diginas_app/challenger/widgets/cadre.dart';
import 'package:flutter/material.dart';
class ChooseAccount extends StatefulWidget {
  const ChooseAccount({Key? key}) : super(key: key);

  @override
  State<ChooseAccount> createState() => _ChooseAccountState();
}

class _ChooseAccountState extends State<ChooseAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 247, 247, 247),
                Color.fromARGB(255, 226, 216, 216),
                Color.fromARGB(255, 147, 205, 176),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 25.0, bottom: 10),
                  child: Text(
                    "Choose your account",
                    style: TextStyle(
                        color: Color.fromARGB(255, 9, 241, 172),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: const Color.fromARGB(255, 241, 235, 235),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()));
                  },
                  child: const Cadre(
                    title: "Challenger",
                    message:
                        'You can join challenges and gain money whenever you win',
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: const Color.fromARGB(255, 230, 226, 226),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()));
                  },
                  child: const Cadre(
                    title: "Buisness",
                    message: 'you can create challenges and make ads',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
