import 'package:tap2024/models/popular_model.dart';

class TopLevel {
  final int id;
  final List<Cast> cast;

  TopLevel({required this.id, required this.cast});

  factory TopLevel.fromJson(Map<String, dynamic> json) {
    var list = json['cast'] as List;
    List<Cast> castList = list.map((i) => Cast.fromJson(i)).toList();

    return TopLevel(
      id: json['id'],
      cast: castList,
    );
  }
}

class Cast {
  final String name;
  final String character;
  final String profilePath;

  Cast({required this.name, required this.character, required this.profilePath});

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      name: json['name'],
      character: json['character'],
      profilePath: json['profile_path'] ?? '',
    );
  }
}
