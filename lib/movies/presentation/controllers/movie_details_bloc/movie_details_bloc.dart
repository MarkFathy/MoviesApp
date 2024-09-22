
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/movies/domain/entities/movie_recomendations.dart';
import 'package:movies/movies/domain/usecases/get_movie_details_usecase.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movie_details.dart';
import '../../../domain/usecases/get_recommendation_movies_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMoviesUseCase getRecommendationMoviesUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationMoviesUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      final result = await getMovieDetailsUseCase(MovieDetailsParams(movieId: event.id));

      result.fold(
            (l) {
          emit(state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsMessage: l.message,
          ));
        },
            (r) {
          emit(state.copyWith(
            movieDetails: r,
            movieDetailsState: RequestState.loaded,
          ));
        },
      );
    });

    on<GetMovieRecommendationEvent>((event, emit) async {
      emit(state.copyWith(movieRecommendationsState: RequestState.loading));

      final result = await getRecommendationMoviesUseCase(MovieRecommendationParams(movieId: event.id));

      result.fold(
            (l) {
          emit(state.copyWith(
            movieRecommendationsState: RequestState.error,
            movieRecommendationsMessage: l.message,
          ));
        },
            (r) {
          emit(state.copyWith(
            movieRecommendations: r,
            movieRecommendationsState: RequestState.loaded,
          ));
        },
      );
    });
  }
}
