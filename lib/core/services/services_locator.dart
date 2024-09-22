import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movies/movies/data/repository/movies_repository.dart';
import 'package:movies/movies/domain/repository/base_movies_repo.dart';
import 'package:movies/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';

import '../../movies/domain/usecases/get_movie_details_usecase.dart';
import '../../movies/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_recommendation_movies_usecase.dart';
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

    getIt.registerFactory(() => MovieDetailsBloc(getIt(),getIt()));

    //UseCases
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetRecommendationMoviesUseCase(getIt()));

    //Repo
    getIt.registerLazySingleton<BaseMoviesRepo>(() => MoviesRepository(getIt()));

    //DataSource
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MoviesRemoteDataSource());

     }
}