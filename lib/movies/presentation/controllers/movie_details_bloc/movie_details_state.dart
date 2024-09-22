part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  final List<MovieRecommendations> movieRecommendations; // Add this
  final RequestState movieRecommendationsState; // Add this
  final String movieRecommendationsMessage; // Add this

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.movieRecommendations = const [], // Initialize this
    this.movieRecommendationsState = RequestState.loading, // Initialize this
    this.movieRecommendationsMessage = '',
  });

  // Add a copyWith method that includes recommendations
  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<MovieRecommendations>? movieRecommendations,
    RequestState? movieRecommendationsState,
    String? movieRecommendationsMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieRecommendations: movieRecommendations ?? this.movieRecommendations,
      movieRecommendationsState: movieRecommendationsState ?? this.movieRecommendationsState,
      movieRecommendationsMessage: movieRecommendationsMessage ?? this.movieRecommendationsMessage,
    );
  }

  @override
  List<Object?> get props => [
    movieDetails,
    movieDetailsState,
    movieDetailsMessage,
    movieRecommendations,
    movieRecommendationsState,
    movieRecommendationsMessage,
  ];
}
