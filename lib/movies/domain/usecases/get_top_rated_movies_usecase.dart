
import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/repository/base_movies_repo.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie_class.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>, NoParams> {
  final BaseMoviesRepo baseMoviesRepo;
  GetTopRatedMoviesUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async{
    return await baseMoviesRepo.getTopRatedMovies();
  }

}