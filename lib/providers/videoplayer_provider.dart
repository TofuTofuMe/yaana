import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayerState extends Notifier<Player> {
  late final Player _player;
  late final VideoController _controller;

  @override
  Player build() {
    _player = Player();
    _controller = VideoController(_player);
    return _player;
  }

  VideoController getController() {
    return _controller;
  }

  void playUrl(String videoUrl) {
    state.open(Media(videoUrl), play: true);
  }
}

final videoPlayerProvider =
    NotifierProvider<VideoPlayerState, Player>(VideoPlayerState.new);
