

import 'package:movies/src/models/movie.dart';

class MoviesCollection {
  int page;  
  List<Movie> movies = [];

  MoviesCollection.fromJson(Map<String, dynamic> parsedJson) {
    page = parsedJson['page'];

    final int resultsCount = parsedJson['results'].length;
    for (var i = 0; i < resultsCount; i++) {
      final movie = Movie.fromJson(parsedJson['results'][i]);
      movies.add(movie);
    }
  }
}