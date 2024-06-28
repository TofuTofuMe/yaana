import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaana/models/api_model.dart';
import 'package:yaana/providers/videoplayer_provider.dart';

class EpisodeSourceListWidget extends ConsumerWidget {
  final List<EpisodeSource> episodeSources;

  const EpisodeSourceListWidget({super.key, required this.episodeSources});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: episodeSources.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.5),
          child: ListTile(
            title: Text(episodeSources[index].quality),
            tileColor: Theme.of(context).colorScheme.onPrimaryContainer,
            textColor: Theme.of(context).colorScheme.onSurface,
            onTap: () {
              ref
                  .read(videoPlayerProvider.notifier)
                  .playUrl(episodeSources[index].episodeUrl);
            },
          ),
        );
      },
    );
  }
}
