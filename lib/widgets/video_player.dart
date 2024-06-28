import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:yaana/providers/videoplayer_provider.dart';

class VideoPlayerWidget extends ConsumerWidget {
  final String videoUrl;
  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoPlayer = ref.read(videoPlayerProvider.notifier);
    final videoController = videoPlayer.getController();
    videoPlayer.playUrl(videoUrl);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 9.0 / 16.0,
      child: Video(
        controller: videoController,
      ),
    );
  }
}
