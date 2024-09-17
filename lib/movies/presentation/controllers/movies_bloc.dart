import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';

import '../../domain/entities/movie_class.dart';
import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase, this.getTopRatedMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();

      result.fold(
            (l) {
          emit(state.copyWith(
            nowPlayingState: RequestState.error,
            message: l.message,
          ));
        },
            (r) {
          emit(state.copyWith(
            nowPlayingMovies: r,
            nowPlayingState: RequestState.loaded,
          ));
        },
      );
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.execute();

      result.fold(
            (l) {
          emit(state.copyWith(
            popularMoviesState: RequestState.error,
            errorMessage: l.message,
          ));
        },
            (r) {
          emit(state.copyWith(
            popularMovies: r,
            popularMoviesState: RequestState.loaded,
          ));
        },
      );
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase.execute();

      result.fold(
            (l) {
          emit(state.copyWith(
            topRatedMoviesState: RequestState.error,
            topRatedMoviesMessage: l.message,
          ));
        },
            (r) {
          emit(state.copyWith(
            topRatedMovies: r,
            topRatedMoviesState: RequestState.loaded,
          ));
        },
      );
    });
  }
}
