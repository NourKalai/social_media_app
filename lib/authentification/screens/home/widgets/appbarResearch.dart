import 'package:diginas_app/authentification/screens/home/widgets/searchTextField.dart';

import 'package:flutter/material.dart';

class AppBarResearch extends StatefulWidget {
  GlobalKey<ScaffoldState>? scaffoldKey;
  String? title;
  AppBarResearch({
    Key? key,
    this.scaffoldKey,
    this.title,
  }) : super(key: key);
  @override
  State<AppBarResearch> createState() => _AppBarResearchState();
}

class _AppBarResearchState extends State<AppBarResearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      height: 90,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 44, 92, 224),
            Color.fromARGB(255, 10, 238, 124),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SearchTextField(title: "Search by name"),
        ],
      ),
    );
  }
}
