import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaana/models/api_model.dart';
import 'package:yaana/providers/episodelist_provider.dart';
import 'package:yaana/views/player.dart';

class EpisodeListWidget extends ConsumerWidget {
  final DetailedAnime anime;
  const EpisodeListWidget({super.key, required this.anime});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episodeList = ref.watch(episodeListProvider);

    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: episodeList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.5),
            child: ListTile(
              title: Text('Episode ${episodeList[index].number}'),
              tileColor: Theme.of(context).colorScheme.onPrimaryContainer,
              textColor: Theme.of(context).colorScheme.onSurface,
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayerPage(
                            anime: anime, episode: episodeList[index])));
              },
            ),
          );
        });
  }
}
