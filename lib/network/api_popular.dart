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