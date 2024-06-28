import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaana/models/api_model.dart';
import 'package:yaana/data/client.dart';
import 'package:yaana/providers/config_provider.dart';
import 'package:yaana/widgets/episodesource_list.dart';
import 'package:yaana/widgets/loading_dialog.dart';
import 'package:yaana/widgets/video_player.dart';

class PlayerPage extends ConsumerStatefulWidget {
  final DetailedAnime anime;
  final Episode episode;

  const PlayerPage({required this.anime, required this.episode});

  @override
  ConsumerState<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends ConsumerState<PlayerPage> {
  late Future<List<EpisodeSource>> _episodeSource;

  @override
  void initState() {
    super.initState();
    _episodeSource =
        getEpisodeSources('gogoanime', widget.episode).then((episode) {
      return episode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final videoRes = ref.read(configProvider).videoResolution;
    return FutureBuilder(
        future: _episodeSource,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    VideoPlayerWidget(
                        videoUrl: snapshot.data!
                            .singleWhere((source) => source.quality == videoRes)
                            .episodeUrl),
                    Container(
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${widget.anime.title}, ep. ${widget.episode.number}',
                        style: Theme.of(context).primaryTextTheme.titleLarge,
                      ),
                    ),
                    EpisodeSourceListWidget(episodeSources: snapshot.data!)
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            Navigator.pop(context);
            throw Exception();
          }

          return const LoadingDialog(message: 'Getting episode streams');
        });
  }
}
