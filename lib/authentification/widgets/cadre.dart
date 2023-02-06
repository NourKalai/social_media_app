import 'package:flutter/material.dart';

import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Cadre extends StatefulWidget {
  String title = "";
  String message = "";

  Cadre({Key? key, required this.title, required this.message})
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
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: const Color.fromARGB(255, 208, 215, 230),
            gradient: LinearGradient(
                colors: [(const Color(0xFF00CCFF)), (Colors.blue.shade400)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Center(
            child: Column(children: [
          Container(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                  onPressed: () {
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.info,
                        text: widget.message);
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
