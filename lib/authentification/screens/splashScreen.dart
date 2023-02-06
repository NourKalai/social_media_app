import 'dart:async';
import 'package:diginas_app/authentification/screens/OnBoard/onboardscreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  int _start = 0;

  void startTimer() {
    _start = 0;
    _timer = Timer.periodic(
        const Duration(milliseconds: 50),
        (Timer timer) => setState(() {
              _start == 20
                  ? {
                      timer.cancel(),
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ConcentricTransitionPage()));
                      })
                    }
                  : _start++;
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 42, 190, 99),
                gradient: LinearGradient(colors: [
                  (Color.fromARGB(255, 13, 153, 100)),
                  (Color.fromARGB(255, 102, 199, 150))
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
        Center(
          child: SizedBox(
            width: 110,
            height: 130,
            child: Image.asset("assets/images/diginaslogo.png"),
          ),
        ),
      ]),
    );
  }
}
