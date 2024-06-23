import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaana/models/config_model.dart';

class ConfigNotifier extends Notifier<Config> {
  @override
  Config build() => Config(
      lightMode: false,
      apiUrl: '10.0.2.2:3000',
      animeService: 'gogoanime',
      videoResolution: '720p',
      showSubOrDub: 'both',
      saveHistory: true,
      watchHistory: WatchHistory(anime: [], episodes: []));

  void update({
    bool? lightMode,
    String? apiUrl,
    String? animeService,
    String? videoResolution,
    String? showSubOrDub,
    bool? saveHistory,
    WatchHistory? watchHistory,
  }) {
    state = Config(
      lightMode: lightMode ?? state.lightMode,
      apiUrl: apiUrl ?? state.apiUrl,
      animeService: animeService ?? state.animeService,
      videoResolution: videoResolution ?? state.videoResolution,
      showSubOrDub: showSubOrDub ?? state.showSubOrDub,
      saveHistory: saveHistory ?? state.saveHistory,
      watchHistory: watchHistory ?? state.watchHistory,
    );
  }
}

final configProvider =
    NotifierProvider<ConfigNotifier, Config>(ConfigNotifier.new);
