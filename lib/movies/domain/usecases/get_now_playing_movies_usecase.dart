
import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/repository/base_movies_repo.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_class.dart';

class GetNowPlayingMoviesUseCase{
  final BaseMoviesRepo baseMoviesRepo;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepo);

  Future<Either<Failure,List<Movie>>> execute()async{
    return await baseMoviesRepo.getNowPlayingMovies();
  }
}