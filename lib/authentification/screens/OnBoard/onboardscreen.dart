// ignore: avoid_print

import 'package:diginas_app/authentification/screens/sign%20in/login.screen.dart';
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
/////////////////////////////////////
//@CodeWithFlexz on Instagram
//
//AmirBayat0 on Github
//Programming with Flexz on Youtube
/////////////////////////////////////
  List<ConcentricModel> concentrics = [
    ConcentricModel(
      lottie: "https://assets4.lottiefiles.com/packages/lf20_lhpm8hja.json",
      text: "Get new\nknowledge",
    ),
    ConcentricModel(
      lottie: "https://assets6.lottiefiles.com/packages/lf20_tk6xxpgj.json",
      text: "Take time for\nyourself",
    ),
    ConcentricModel(
      lottie: "https://assets8.lottiefiles.com/packages/lf20_fbzszqak.json",
      text: "Do what you\nlove",
    ),
    ConcentricModel(
      lottie: "https://assets8.lottiefiles.com/packages/lf20_prsoqox5.json",
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
              Color.fromARGB(255, 184, 106, 236),
              Color(0xff013BCA),
              Colors.white,
              Color.fromARGB(183, 89, 245, 172),
            ],
            itemCount: concentrics.length,
            onFinish: () {
              print("Finished");
            },
            itemBuilder: (index) => Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            // ignore: avoid_print
                            print("Skipped");
                          },
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              },
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 8, 18, 41),
                                    fontSize: 16),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 290,
                      width: 300,
                      child: Lottie.network(concentrics[index].lottie,
                          animate: true),
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
                  ],
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
