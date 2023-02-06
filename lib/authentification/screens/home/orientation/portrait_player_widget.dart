import 'package:diginas_app/authentification/screens/home/orientation/video_player_fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PortraitPlayerWidget extends StatefulWidget {
  final String src;
  PortraitPlayerWidget({super.key, required this.src});
  @override
  _PortraitPlayerWidgetState createState() => _PortraitPlayerWidgetState();
}

class _PortraitPlayerWidgetState extends State<PortraitPlayerWidget> {
  late VideoPlayerController controller;
  final asset = 'flutter_assets/video.mp4';

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
  Widget build(BuildContext context) =>
      VideoPlayerFullscreenWidget(controller: controller);
}
