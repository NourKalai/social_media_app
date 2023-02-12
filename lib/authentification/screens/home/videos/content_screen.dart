import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import '../orientation/portrait_player_widget.dart';
import '../widgets/like_icon.dart';
import 'options_screen.dart';

class ContentScreen extends StatefulWidget {
  final String src;

  const ContentScreen({super.key, required this.src});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController chewieController;
  bool _liked = false;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.src);
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
    return Stack(
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
        OptionsScreen()
      ],
    );
  }
}
