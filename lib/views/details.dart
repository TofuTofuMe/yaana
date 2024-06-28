import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaana/models/api_model.dart';
import 'package:yaana/providers/config_provider.dart';
import 'package:yaana/providers/episodelist_provider.dart';
import 'package:yaana/data/client.dart';
import 'package:yaana/widgets/episode_list.dart';
import 'package:yaana/widgets/loading_dialog.dart';

class Details extends ConsumerStatefulWidget {
  final Anime anime;

  const Details({super.key, required this.anime});

  @override
  ConsumerState<Details> createState() => _DetailsState();
}

class _DetailsState extends ConsumerState<Details> {
  late Future<DetailedAnime> _detailedAnime;

  @override
  void initState() {
    super.initState();
    final animeService = ref.read(configProvider).animeService;
    _detailedAnime = getDetailedAnime(animeService, widget.anime).then((anime) {
      ref.read(episodeListProvider.notifier).setList(anime.episodes);
      return anime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _detailedAnime,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              body: Container(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Image(
                                image: NetworkImage(snapshot.data!.image),
                                height: MediaQuery.sizeOf(context).height / 4,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width / 2,
                                    child: Text(
                                      snapshot.data!.title,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width / 2,
                                    child: DefaultTextStyle.merge(
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .titleSmall,
                                        textAlign: TextAlign.left,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!.genres.join(', '),
                                            ),
                                            Text(
                                              snapshot.data!.status,
                                            ),
                                            Text(
                                              snapshot.data!.releaseDate,
                                            ),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              snapshot.data!.description,
                            )),
                          ],
                        ),
                        const Divider(),
                        EpisodeListWidget(
                          anime: snapshot.data!,
                        )
                      ],
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            Navigator.pop(context);
            throw Exception(snapshot.error.toString());
          }

          return const LoadingDialog(message: 'Getting anime details');
        });
  }
}
