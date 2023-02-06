import 'package:diginas_app/authentification/screens/home/models/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/content_model.dart';
import '../vertical_icon_button.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({super.key, required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            height: 500,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/challenge5.jpg'),
                    fit: BoxFit.cover))),
        Container(
          height: 500,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Positioned(
          left: 60,
          bottom: 100,
          child: SizedBox(
            width: 350,
            child: Text(
              "New Challenge",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                    icon: Icons.add,
                    title: "List",
                    onTap: () => print("My List")),
                _PlayButton(),
                VerticalIconButton(
                    icon: Icons.info_outline,
                    title: "Info",
                    onTap: () => print("Info"))
              ],
            ))
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 20, 5),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 108, 160, 24)),
        icon: const Icon(Icons.play_arrow, size: 30),
        onPressed: () {},
        label: const Text('Play',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }
}
