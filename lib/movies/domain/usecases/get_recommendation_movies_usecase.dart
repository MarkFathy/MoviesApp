
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entities/movie_recomendations.dart';
import 'package:movies/movies/domain/repository/base_movies_repo.dart';
import '../../../core/usecase/base_usecase.dart';

class GetRecommendationMoviesUseCase extends BaseUseCase<List<MovieRecommendations>, MovieRecommendationParams> {
  final BaseMoviesRepo baseMoviesRepo;
  GetRecommendationMoviesUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<MovieRecommendations>>> call(MovieRecommendationParams params) async{
    return await baseMoviesRepo.getRecommendationMovies(params);
  }



}

class MovieRecommendationParams extends Equatable {
  final int movieId;
  const MovieRecommendationParams({required this.movieId});

  @override
  List<Object> get props => [movieId];
}