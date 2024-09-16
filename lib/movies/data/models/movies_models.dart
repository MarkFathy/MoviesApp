import 'package:movies/movies/domain/entities/movie_class.dart';

class MoviesModel extends Movie {
  MoviesModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
    id: json['id'],
    title: json['title'],
    backdropPath: json['backdrop_path'],
    genreIds: List<int>.from(json['genre_ids'].map((e)=>e)),
    overview: json['overview'],
    releaseDate: json['release_date'],
    voteAverage: json['vote_average'],
  );
}
