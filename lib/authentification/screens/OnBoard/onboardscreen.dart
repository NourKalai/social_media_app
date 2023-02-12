// ignore: avoid_print

import 'package:diginas_app/authentification/screens/sign%20in/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class ConcentricTransitionPage extends StatefulWidget {
  const ConcentricTransitionPage({Key? key}) : super(key: key);

  @override
  State<ConcentricTransitionPage> createState() =>
      _ConcentricTransitionPageState();
}

class _ConcentricTransitionPageState extends State<ConcentricTransitionPage> {
  List<ConcentricModel> concentrics = [
    ConcentricModel(
      lottie: "https://assets5.lottiefiles.com/packages/lf20_N1FgLO.json",
      text: "Get new\nknowledge",
    ),
    ConcentricModel(
      lottie: "https://assets6.lottiefiles.com/packages/lf20_tk6xxpgj.json",
      text: "Take time for\nyourself",
    ),
    ConcentricModel(
      lottie: "https://assets9.lottiefiles.com/packages/lf20_3rlzwL.json",
      text: "Do what you\nlove",
    ),
    ConcentricModel(
      lottie: "https://assets5.lottiefiles.com/packages/lf20_N1FgLO.json",
      text: "Try something\nnew",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ConcentricPageView(
            onChange: (val) {},
            colors: const <Color>[
              Color.fromARGB(255, 78, 172, 109),
              Color.fromARGB(255, 58, 201, 170),
              Color.fromARGB(252, 247, 245, 245),
              Color.fromARGB(183, 89, 245, 172),
            ],
            itemCount: concentrics.length,
            onFinish: () {
              // print("Finished");
            },
            itemBuilder: (index) => SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, right: 20),
                          child: GestureDetector(
                            onTap: () {},
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                  );
                                },
                                child: const Text(
                                  "Skip",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 8, 18, 41),
                                      fontSize: 16),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 290,
                          width: 300,
                          child: Lottie.network(concentrics[index].lottie,
                              animate: true),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          "${index + 1} / ${concentrics.length}",
                          style: GoogleFonts.rubik(
                              color: index == 2 ? Colors.black : Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 22),
                        ),
                      ),
                      Text(
                        concentrics[index].text,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                          color: index == 2 ? Colors.black : Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}

class ConcentricModel {
  String lottie;
  String text;
  //
  ConcentricModel({
    required this.lottie,
    required this.text,
  });
}
