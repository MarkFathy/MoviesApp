import 'package:movies/movies/domain/entities/movie_recomendations.dart';

class MovieRecommendationModel extends MovieRecommendations {
  const MovieRecommendationModel({
    required super.id,
     super.backdropPath,

  });

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) => MovieRecommendationModel(
    id: json['id'],
    backdropPath: json['backdrop_path']?? "/a68COsb7PvpEUIBa9vA3mvZMS3I.jpg",
  );
}
