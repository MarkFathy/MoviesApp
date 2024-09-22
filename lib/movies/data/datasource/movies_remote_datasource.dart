import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/core/network/api_const.dart';
import 'package:movies/movies/data/models/movies_models.dart';
import 'package:movies/movies/data/models/recommendation_model.dart';
import 'package:movies/movies/domain/entities/movie_recomendations.dart';
import 'package:movies/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies/movies/domain/usecases/get_recommendation_movies_usecase.dart';

import '../models/movie_details_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParams params);
  Future<List<MovieRecommendationModel>> getMoviesRecommendation(MovieRecommendationParams params);
}

class MoviesRemoteDataSource implements BaseMovieRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await dio.get(ApiConst.nowPlayingMoviesPath);
    print(response);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await dio.get(ApiConst.popularMoviesPath);
    print(response.toString());
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await dio.get(ApiConst.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParams params) async{
    final response = await dio.get(ApiConst.movieDetailsPath(params.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieRecommendationModel>> getMoviesRecommendation(MovieRecommendationParams params) async{
    final response = await dio.get(ApiConst.moviesRecommendationPath(params.movieId));
    if (response.statusCode == 200) {
      return List<MovieRecommendationModel>.from(
          (response.data['results'] as List)
              .map((e) => MovieRecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }



}
