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
  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMoviesMessage;

  const MoviesState({
    //Now playing movies
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.message = '',

    //popular movies
    this.popularMovies = const [],
    this.popularMoviesState = RequestState.loading,
    this.errorMessage = '',

    //Top rated movies
    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.loading,
    this.topRatedMoviesMessage = '',


  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? message,
    List<Movie>? popularMovies,
    RequestState? popularMoviesState,
    String? errorMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMoviesMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      message: message ?? this.message,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      errorMessage: errorMessage ?? this.errorMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMoviesMessage: topRatedMoviesMessage ??
          this.topRatedMoviesMessage,
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
    //Top rated movies
    topRatedMovies,
    topRatedMoviesState,
    topRatedMoviesMessage,

  ];
}
