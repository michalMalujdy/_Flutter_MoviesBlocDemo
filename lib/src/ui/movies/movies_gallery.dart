import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:movies/src/blocs/movies_bloc.dart';
import 'package:movies/src/models/movies_collection.dart';

class MoviesGallery extends StatelessWidget {

  final _moviesBloc = MoviesBloc();
  get moviesStream => _moviesBloc.movies;

  MoviesGallery() {
    _moviesBloc.getAllMovies(); // TODO resolve if this is a good place to 
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: moviesStream,
      builder: (context, AsyncSnapshot<MoviesCollection> snapshot) {
        if (snapshot.hasData) {
          var moviesNames = '';
          for (var movie in snapshot.data.movies) {
            moviesNames += movie.title + '\n';
          }
          return Text(moviesNames);
        }
        else if(snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        
        return Center(
          child: CircularProgressIndicator()
        );
      },
    );
  }
}