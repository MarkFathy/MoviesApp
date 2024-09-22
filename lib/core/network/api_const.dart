class ApiConst{
 //ApiKey
 static const apiKey='08cc3670b50668aee750f0ab1a581ae0';

 ///////////////////////////////////

 static const baseUrl='https://api.themoviedb.org/3';
 static const nowPlayingMoviesPath='$baseUrl/movie/now_playing?api_key=$apiKey';
 static const popularMoviesPath='$baseUrl/movie/popular?api_key=$apiKey';
 static const topRatedMoviesPath='$baseUrl/movie/top_rated?api_key=$apiKey';
 static const baseImageUrl='https://image.tmdb.org/t/p/w500';
 static imageUrl(String path)=> '$baseImageUrl$path';
 static movieDetailsPath(int movieId)=> '$baseUrl/movie/$movieId?api_key=$apiKey';
 static moviesRecommendationPath(int movieId)=> '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';



}

