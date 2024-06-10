import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tap2024/models/popular_model.dart';
import 'package:tap2024/models/trailer_model.dart';

class ApiPopular {
  final String apiKey = '09f36df3b4479b55e46a2c1c2e74cec2';
  final String baseUrl = 'https://api.themoviedb.org/3'; // Corrección de la base URL

  Future<List<PopularModel>?> getAllPopular() async {
    final Uri uri = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey&language=en-US&page=1');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonPopular = jsonDecode(response.body)['results'] as List;
      return jsonPopular.map((popular) => PopularModel.fromMap(popular)).toList();
    }
    return null;
  }

  Future<List<VideoModel>?> getMovieVideos(int movieId) async {
  final Uri uri = Uri.parse('$baseUrl/movie/$movieId/videos?api_key=$apiKey&language=es-MX');

  final response = await http.get(uri);
  if (response.statusCode == 200) {
    final jsonVideos = jsonDecode(response.body)['results'] as List;
    return jsonVideos.map((video) => VideoModel.fromJson(video)).toList();
  }
  return null;
}
}
