import 'package:diginas_app/challenger/screens/home/orientation/video_player_both_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PortraitLandscapePlayerPage extends StatefulWidget {
  final String src;
  const PortraitLandscapePlayerPage({super.key, required this.src});

  @override
  // ignore: library_private_types_in_public_api
  _PortraitLandscapePlayerPageState createState() =>
      _PortraitLandscapePlayerPageState();
}

class _PortraitLandscapePlayerPageState
    extends State<PortraitLandscapePlayerPage> {
  late VideoPlayerController controller;
  final asset = 'flutter_assets/video.mp4';
  final List<String> videos = [
    'https://assets.mixkit.co/videos/preview/mixkit-waves-in-the-water-1164-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-waves-in-the-water-1164-large.mp4',
  ];
  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(widget.src)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: VideoPlayerBothWidget(controller: controller),
      );
}
