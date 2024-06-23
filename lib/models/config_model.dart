import 'package:yaana/models/api_model.dart';

class Config {
  final bool lightMode;
  final String apiUrl;

  final String animeService;
  final String videoResolution;
  final String showSubOrDub;

  final bool saveHistory;
  final WatchHistory watchHistory;

  const Config(
      {required this.lightMode,
      required this.apiUrl,
      required this.animeService,
      required this.videoResolution,
      required this.showSubOrDub,
      required this.saveHistory,
      required this.watchHistory});
}

class WatchHistory {
  final List<Anime> anime;
  final List<Episode> episodes;

  const WatchHistory({required this.anime, required this.episodes});
}
