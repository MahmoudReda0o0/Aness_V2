//import 'package:audio/Feature/Presintation/VideoPlayer/widget/BasicOverLayWidget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'BasicOverLayWidget.dart';

class VideoPlayerWidget extends StatelessWidget {
  VideoPlayerWidget({required this.controller});
  VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return controller != null && controller.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: BuildVideo(),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget BuildVideo() => Stack(
        children: [
          BuildVideoPlayer(),
          Positioned.fill(child: BasicOverLawWidget(controller: controller,)),
        ],
      );

  Widget BuildVideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));
}
