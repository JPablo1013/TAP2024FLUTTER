class PopularModel {
  String backdropPath;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  double voteAverage;
  int voteCount;
  //bool video;

  PopularModel({
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    //required this.video,
  });

   factory PopularModel.fromMap (Map<String,dynamic> map){
    return PopularModel(
      backdropPath: map['backdrop_path'] ?? '', 
      id: map['id'], 
      originalLanguage: map['original_language'], 
      originalTitle: map['original_title'], 
      overview: map['overview'], 
      popularity: map['popularity'], 
      posterPath: map['poster_path'], 
      releaseDate: map['release_date'], 
      title: map['title'], 
      voteAverage: map['vote_average'], 
      voteCount: map['vote_count'],
      //video: map['video'],
    );
  }

}
