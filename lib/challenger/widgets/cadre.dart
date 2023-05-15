import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cadre extends StatefulWidget {
  final String title;
  final String message;

  const Cadre({Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  State<Cadre> createState() => _CadreState();
}

class _CadreState extends State<Cadre> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        height: 200,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromARGB(255, 208, 215, 230),
            gradient: LinearGradient(colors: [
              (Color.fromARGB(255, 9, 241, 172)),
              (Color.fromARGB(255, 6, 109, 58))
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
            child: Column(children: [
          Container(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                              child: AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: Text(
                                    textAlign: TextAlign.center,
                                    widget.title,
                                    style: GoogleFonts.urbanist(
                                        textStyle: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black))),
                                content: Container(
                                  height: 130,
                                  child: Column(
                                    children: [
                                      Text(widget.message,
                                          style: GoogleFonts.urbanist(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black))),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      SizedBox(
                                        height: 40, //height of button
                                        width: 150, //width of button
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                              side: MaterialStateProperty.all(
                                                const BorderSide(
                                                    width: 2,
                                                    color: Colors.green),
                                              ),
                                              elevation:
                                                  MaterialStateProperty.all(2),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white),
                                              //   fixedSize: MaterialStateProperty.all(

                                              shape: MaterialStateProperty.all(
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
                                              )),
                                            ),
                                            child: Text("Confirm",
                                                style: GoogleFonts.urbanist(
                                                    textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF08BA97),
                                                )))),
                                      ),
                                    ],
                                  ),
                                ),
                                actionsAlignment: MainAxisAlignment.center,
                              ),
                            ));
                  },
                  icon: const Icon(
                    Icons.info,
                    color: Colors.white,
                    size: 30,
                  ))),
          Container(
            margin: const EdgeInsets.only(right: 20, top: 20, left: 20),
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          )
        ])));
  }
}
