

import 'package:movies/src/models/movie.dart';

class MoviesCollection {
  int page;  
  List<Movie> movies = [];

  MoviesCollection.fromJson(Map<String, dynamic> parsedJson) {
    page = parsedJson['page'];
    // final total_results = parsedJson['total_results'];
    // final total_pages = parsedJson['total_pages'];

    final int resultsCount = parsedJson['results'].length;
    for (var i = 0; i < resultsCount; i++) {
      final movie = Movie.fromJson(parsedJson['results'][i]);
      movies.add(movie);
    }
  }
}