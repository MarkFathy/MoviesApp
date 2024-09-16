part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  //Now playing movies
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String message;
  //popular movies
  final List<Movie> popularMovies;
  final RequestState popularMoviesState;
  final String errorMessage;


  //top rated movies

  const MoviesState({
    //Now playing movies
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.message = '',

    //popular movies
    this.popularMovies = const [],
    this.popularMoviesState = RequestState.loading,
    this.errorMessage = '',


  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? message,
    List<Movie>? popularMovies,
    RequestState? popularMoviesState,
    String? errorMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      message: message ?? this.message,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    //Now playing movies
    nowPlayingMovies,
    nowPlayingState,
    message,
    //Popular Movies
    popularMovies,
    popularMoviesState,
    errorMessage,

  ];
}
