import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaana/providers/animelist_provider.dart';
import 'package:yaana/providers/config_provider.dart';
import 'package:yaana/views/details.dart';

class AnimeListWidget extends ConsumerWidget {
  const AnimeListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeList = ref.watch(animeListProvider);
    final showSubOrDub = ref.read(configProvider).showSubOrDub;
    final animeFiltered = [];
    for (final anime in animeList) {
      if (anime.subOrDub == showSubOrDub || showSubOrDub == 'both') {
        animeFiltered.add(anime);
      }
    }

    return ListView.builder(
      itemCount: animeFiltered.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(2.5),
            child: ListTile(
              title: Center(child: Text(animeFiltered[index].title)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Details(anime: animeFiltered[index])));
              },
              tileColor: Theme.of(context).colorScheme.onPrimaryContainer,
              textColor: Theme.of(context).colorScheme.onSurface,
            ));
      },
    );
  }
}
