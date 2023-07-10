import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BasicOverLawWidget extends StatefulWidget {
  BasicOverLawWidget({required this.controller});
  VideoPlayerController controller;

  @override
  State<BasicOverLawWidget> createState() => _BasicOverLawWidgetState();
}

class _BasicOverLawWidgetState extends State<BasicOverLawWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        widget.controller.value.isPlaying
            ? widget.controller.pause()
            : widget.controller.play();
        setState(() {});
      },
      child: Stack(
        children: [
          BuildPlayVideo(),
          Positioned(bottom: 0, left: 0, right: 0, child: buildIndicator()),
        ],
      ),
    );
  }

  Widget buildIndicator() =>
      VideoProgressIndicator(widget.controller, allowScrubbing: true);

  Widget BuildPlayVideo() => widget.controller.value.isPlaying
      ? SizedBox()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 80,
          ),
        );
}
