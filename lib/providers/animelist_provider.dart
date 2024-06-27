import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaana/models/api_model.dart';

class AnimeListNotifier extends Notifier<List<Anime>> {
  @override
  List<Anime> build() => [];

  void add(Anime anime) {
    state = [...state, anime];
  }

  void setList(List<Anime> anime) {
    state = anime;
  }
}

final animeListProvider =
    NotifierProvider<AnimeListNotifier, List<Anime>>(AnimeListNotifier.new);
