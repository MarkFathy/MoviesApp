import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movies/movies/data/repository/movies_repository.dart';
import 'package:movies/movies/domain/repository/base_movies_repo.dart';

import '../../movies/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../movies/presentation/controllers/movies_bloc.dart';

final getIt=GetIt.instance;
class ServicesLocator{

  void setupLocator() {
    //Bloc
    getIt.registerFactory(() => MoviesBloc(
      getIt<GetNowPlayingMoviesUseCase>(),
      getIt<GetPopularMoviesUseCase>(),
      getIt<GetTopRatedMoviesUseCase>(),
    ));

    //UseCases
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMoviesUseCase(getIt()));

    //Repo
    getIt.registerLazySingleton<BaseMoviesRepo>(() => MoviesRepository(getIt()));

    //DataSource
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MoviesRemoteDataSource());

     }
}