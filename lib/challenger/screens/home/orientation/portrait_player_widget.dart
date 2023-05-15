import 'package:diginas_app/challenger/screens/home/orientation/video_player_fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PortraitPlayerWidget extends StatefulWidget {
  final String src;
  final bool isFromInternet;
  const PortraitPlayerWidget(
      {super.key, required this.src, this.isFromInternet = true});
  @override
  // ignore: library_private_types_in_public_api
  _PortraitPlayerWidgetState createState() => _PortraitPlayerWidgetState();
}

class _PortraitPlayerWidgetState extends State<PortraitPlayerWidget> {
  late VideoPlayerController controller;
  final asset = 'flutter_assets/video.mp4';

  @override
  void initState() {
    super.initState();
    controller = (widget.isFromInternet == true)
        ? VideoPlayerController.network(widget.src)
        : VideoPlayerController.asset(widget.src)
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
