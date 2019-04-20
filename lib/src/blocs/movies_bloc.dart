import 'package:rxdart/rxdart.dart';

import 'package:movies/src/models/movies_collection.dart';
import 'package:movies/src/repositories/movies_repository.dart';

class MoviesBloc {
  final _repository = MoviesRepository();
  final _publisher = PublishSubject<MoviesCollection>();

  Observable<MoviesCollection> get movies => _publisher.stream; 

  getAllMovies() async {
    var movies = await _repository.getAllMovies();
    _publisher.sink.add(movies);
  }
}