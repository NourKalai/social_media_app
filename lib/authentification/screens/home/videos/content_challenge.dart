import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../orientation/portrait_player_widget.dart';
import '../widgets/build_post.dart';
import '../widgets/liked_button.dart';
import 'options_screen.dart';

class ContentChallenge extends StatefulWidget {
  final String src;

  const ContentChallenge({super.key, required this.src});

  @override
  State<ContentChallenge> createState() => _ContentChallengeState();
}

class _ContentChallengeState extends State<ContentChallenge> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController chewieController;
  bool _liked = false;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.src);
    chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        showControls: false,
        fullScreenByDefault: true);
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            child: PortraitPlayerWidget(src: widget.src),
            onDoubleTap: () {
              setState(() {
                _liked = !_liked;
              });
            },
          ),
          if (_liked)
            const Center(
              child: LikeIcon(),
            ),
          // OptionsScreen()
        ],
      ),
    );
  }
}
