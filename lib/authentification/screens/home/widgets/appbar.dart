import 'package:diginas_app/authentification/screens/home/widgets/circlebutton.dart';
import 'package:diginas_app/authentification/screens/home/widgets/searchTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatefulWidget {
  const AppbarWidget({super.key});

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(colors: [
            Color.fromARGB(136, 51, 102, 255),
            Color(0xFF00CCFF),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hello,\nWelcome Nour Kalai!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              CircleButton(icon: Icons.notifications, onPressed: () {}),
            ],
          ),
          const SizedBox(height: 20),
          const SearchTextField(),
        ],
      ),
    );
  }
}
