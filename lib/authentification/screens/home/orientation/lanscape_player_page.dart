// ignore_for_file: library_private_types_in_public_api

import 'package:diginas_app/authentification/screens/home/orientation/video_player_fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class LandscapePlayerPage extends StatefulWidget {
  const LandscapePlayerPage({super.key});

  @override
  _LandscapePlayerPageState createState() => _LandscapePlayerPageState();
}

class _LandscapePlayerPageState extends State<LandscapePlayerPage> {
  late VideoPlayerController controller;
  final asset = 'flutter_assets/video.mp4';

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());

    setLandscape();
  }

  @override
  void dispose() {
    controller.dispose();
    setAllOrientations();

    super.dispose();
  }

  Future setLandscape() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    await Wakelock.enable();
  }

  Future setAllOrientations() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);

    await Wakelock.disable();
  }

  @override
  Widget build(BuildContext context) =>
      VideoPlayerFullscreenWidget(controller: controller);
}