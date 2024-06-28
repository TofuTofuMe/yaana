class Anime {
  final String id;
  final String title;
  final String image;
  final String? subOrDub;

  const Anime(
      {required this.id,
      required this.title,
      required this.image,
      required this.subOrDub});

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        subOrDub: json['subOrDub'],
      );

  static List<Anime> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((json) => Anime.fromJson(json)).toList();
}

class Episode {
  final String id;
  final int number;
  final String url;

  Episode({required this.id, required this.number, required this.url});

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json['id'],
        number: json['number'],
        url: json['url'],
      );
}

class DetailedAnime {
  final String id;
  final String title;
  final String image;
  final String url;
  final String releaseDate;
  final String description;
  final List<String> genres;
  final String subOrDub;
  final String type;
  final String status;
  final String otherName;
  final int totalEpisodes;
  final List<Episode> episodes;

  DetailedAnime({
    required this.id,
    required this.title,
    required this.image,
    required this.url,
    required this.releaseDate,
    required this.description,
    required this.genres,
    required this.subOrDub,
    required this.type,
    required this.status,
    required this.otherName,
    required this.totalEpisodes,
    required this.episodes,
  });

  factory DetailedAnime.fromJson(Map<String, dynamic> json) => DetailedAnime(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        url: json['url'],
        releaseDate: json['releaseDate'],
        description: json['description'],
        genres:
            (json['genres'] as List).map((genre) => genre as String).toList(),
        subOrDub: json['subOrDub'],
        type: json['type'],
        status: json['status'],
        otherName: json['otherName'],
        totalEpisodes: json['totalEpisodes'],
        episodes: (json['episodes'] as List)
            .map((episode) => Episode.fromJson(episode))
            .toList(),
      );
}

class EpisodeSource {
  final String episodeUrl;
  final String quality;
  final bool isM3U8;

  EpisodeSource(
      {required this.episodeUrl, required this.quality, required this.isM3U8});

  factory EpisodeSource.fromJson(Map<String, dynamic> json) => EpisodeSource(
      episodeUrl: json['url'],
      quality: json['quality'],
      isM3U8: json['isM3U8']);

  static List<EpisodeSource> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((json) => EpisodeSource.fromJson(json)).toList();
}
