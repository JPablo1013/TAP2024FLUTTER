import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tap2024/models/popular_model.dart';

class ApiPopular{
  Uri uri = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=37f7e51498f67efce9ac39ffc0af3040&language=es-MX&page=1');

  Future<List<PopularModel>?> getAllPopular () async {

    Response response = await http.get(uri);
      if(response.statusCode == 200){
        final jsonPopular = jsonDecode(response.body)['results'] as List;
        return jsonPopular.map((popular) => PopularModel.fromMap(popular)).toList();
      }
    return null;
  }
}

/*class ApiPopular {
  final String apiKey = '37f7e51498f67efce9ac39ffc0af3040';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<PopularModel>?> getAllPopular() async {
    final Uri popularUri = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey&language=es-MX&page=1');

    final response = await http.get(popularUri);
    if (response.statusCode == 200) {
      final jsonPopular = jsonDecode(response.body)['results'] as List;
      return jsonPopular.map((popular) => PopularModel.fromMap(popular)).toList();
    }
    return null;
  }

  Future<TopLevel?> getMovieCredits(int movieId) async {
    final Uri creditsUri = Uri.parse('$baseUrl/movie/$movieId/credits?api_key=$apiKey&language=es-MX');

    final response = await http.get(creditsUri);
    if (response.statusCode == 200) {
      final jsonCredits = jsonDecode(response.body);
      return TopLevel.fromJson(jsonCredits);
    }
    return null;
  }
}*/