import 'package:movies/src/models/movies_collection.dart';
import 'package:movies/src/resources/movies_api_service.dart';

class MoviesRepository {
  final moviesApiService = MoviesApiService();

  Future<MoviesCollection> getAllMovies() async {
    return moviesApiService.getAllMovies();
  }
}