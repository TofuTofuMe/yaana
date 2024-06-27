import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yaana/models/api_model.dart';

const String apiUrl = 'http://10.0.2.2:3000';

Future<DetailedAnime> getDetailedAnime(String service, Anime anime) async {
  final String requestUrl = '$apiUrl/anime/$service/info/${anime.id}';
  try {
    final response = await http.get(Uri.parse(requestUrl));

    if (response.statusCode == 200) {
      return DetailedAnime.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception();
    }
  } catch (error) {
    throw Exception('Failed to fetch anime details: $error');
  }
}

Future<List<EpisodeSource>> getEpisodeSources(
    String service, Episode episode) async {
  final String requestUrl = '$apiUrl/anime/$service/watch/${episode.id}';
  try {
    final response = await http.get(Uri.parse(requestUrl));

    if (response.statusCode == 200) {
      return EpisodeSource.fromJsonList(jsonDecode(response.body)['sources']);
    } else {
      return [];
    }
  } catch (error) {
    throw Exception('Failed to fetch episode source: $error');
  }
}

Future<List<Anime>> getTopAnime(String service) async {
  final String requestUrl = '$apiUrl/anime/$service/top-airing';
  try {
    final response = await http.get(Uri.parse(requestUrl));

    if (response.statusCode == 200) {
      return Anime.fromJsonList(jsonDecode(response.body)['results']);
    } else {
      return [];
    }
  } catch (error) {
    throw Exception('Failed to fetch top anime: $error');
  }
}

Future<List<Anime>> searchAnime(String service, String query) async {
  final String requestUrl = '$apiUrl/anime/$service/$query';
  try {
    final response = await http.get(Uri.parse(requestUrl));

    if (response.statusCode == 200) {
      return Anime.fromJsonList(jsonDecode(response.body)['results']);
    } else {
      return [];
    }
  } on Exception catch (error) {
    throw Exception('Failed to search for anime: $error');
  }
}
