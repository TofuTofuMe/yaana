import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaana/data/client.dart';
import 'package:yaana/providers/animelist_provider.dart';
import 'package:yaana/providers/config_provider.dart';
import 'package:yaana/widgets/anime_list.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    final animeService = ref.read(configProvider).animeService;
    getTopAnime(animeService).then((animeList) {
      ref.read(animeListProvider.notifier).setList(animeList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Center(child: const AnimeListWidget())));
  }
}
