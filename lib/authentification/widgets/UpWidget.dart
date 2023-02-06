import 'package:flutter/material.dart';

class UpWidget extends StatelessWidget {
  String titleText = "";
  UpWidget({Key? key, required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(90)),
          color: Colors.blueAccent,
          gradient: LinearGradient(
              colors: [(Colors.lightBlueAccent), (Colors.blue.shade400)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Image.asset(
                "assets/images/challenge.png",
                height: 100,
                width: 100,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              alignment: Alignment.bottomRight,
              child: Text(
                titleText,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
