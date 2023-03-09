import 'package:diginas_app/authentification/screens/home/challenge_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/content_model.dart';
import '../orientation/portrait_landscape_player_page.dart';
import '../vertical_icon_button.dart';
import '../videos/content_challenge.dart';

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
     decoration: const BoxDecoration(
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
              AppLocalizations.of(context)!.newchallenge,
              style: const TextStyle(color: Colors.white, fontSize: 40),
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
                    title: AppLocalizations.of(context)!.list,
                    onTap: () => {}),
                _PlayButton(),
                VerticalIconButton(
                    icon: Icons.info_outline,
                    title: AppLocalizations.of(context)!.info,
                    onTap: () => const ChallengeStep())
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
            backgroundColor: const Color.fromARGB(255, 108, 160, 24)),
        icon: const Icon(Icons.play_arrow, size: 30),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ContentChallenge(
                      src: 'flutter_assets/help.mp4',
                    )),
          );
        },
        label: Text(AppLocalizations.of(context)!.play,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }
}
