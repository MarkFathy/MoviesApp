import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies/movies/domain/usecases/get_recommendation_movies_usecase.dart';
import '../../../core/error/failure.dart';
import '../entities/movie_class.dart';
import '../entities/movie_recomendations.dart';

abstract class BaseMoviesRepo{

  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailsParams params);
  Future<Either<Failure,List<MovieRecommendations>>> getRecommendationMovies(MovieRecommendationParams params);

}