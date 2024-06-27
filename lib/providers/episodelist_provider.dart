import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaana/models/api_model.dart';

class EpisodeListNotifier extends Notifier<List<Episode>> {
  @override
  List<Episode> build() => [];

  void add(Episode episode) {
    state = [...state, episode];
  }

  void setList(List<Episode> episodes) {
    state = episodes;
  }
}

final episodeListProvider =
    NotifierProvider<EpisodeListNotifier, List<Episode>>(
        EpisodeListNotifier.new);
