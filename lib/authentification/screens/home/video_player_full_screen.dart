import 'package:diginas_app/authentification/screens/home/widgets/basic_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerFullScreenWidget extends StatefulWidget {
  final VideoPlayerController controller;
  const VideoPlayerFullScreenWidget({super.key, required this.controller});

  @override
  State<VideoPlayerFullScreenWidget> createState() =>
      _VideoPlayerFullScreenWidgetState();
}

class _VideoPlayerFullScreenWidgetState
    extends State<VideoPlayerFullScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.controller.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: buildVideo(),
          )
        : Container(
            height: 200,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.greenAccent,
              ),
            ),
          );
  }

  Widget buildVideo() {
    return Stack(fit: StackFit.expand, children: [
      buildVideoPlayer(),
      BasicOverlayWidget(controller: widget.controller)
    ]);
  }

  Widget buildVideoPlayer() => buildFullScreen(
        child: AspectRatio(
            aspectRatio: widget.controller.value.aspectRatio,
            child: VideoPlayer(widget.controller)),
      );

  Widget buildFullScreen({required Widget child}) {
    final size = widget.controller.value.size;
    final width = size.width;
    final height = size.height;
    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(width: width, height: height, child: child),
    );
  }
}
