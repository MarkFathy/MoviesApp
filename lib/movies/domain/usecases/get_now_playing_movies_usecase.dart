
import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/repository/base_movies_repo.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie_class.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>, NoParams> {
  final BaseMoviesRepo baseMoviesRepo;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) {
    return baseMoviesRepo.getNowPlayingMovies();
  }


}

