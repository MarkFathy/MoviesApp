import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie_details.dart';
import '../repository/base_movies_repo.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails,MovieDetailsParams> {
  final BaseMoviesRepo baseMoviesRepo;
  GetMovieDetailsUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParams params)
  {
    return baseMoviesRepo.getMovieDetails(params);
  }
}

//لو انا عايز اضيف اكتر من باراميتار نعمل كلاس للبرارامز و extends ونضيف كلاس البرامز فوق
class MovieDetailsParams extends Equatable {
  final int movieId;

  const MovieDetailsParams({required this.movieId});

  @override
  List<Object> get props => [movieId];
}