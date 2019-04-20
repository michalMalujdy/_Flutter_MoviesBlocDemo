import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:movies/src/blocs/movies_bloc.dart';
import 'package:movies/src/models/movies_collection.dart';

class MoviesGallery extends StatelessWidget {

  final _moviesBloc = MoviesBloc();
  get moviesStream => _moviesBloc.movies;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: moviesStream,
      builder: (context, AsyncSnapshot<MoviesCollection> snapshot) {
        if (snapshot.hasData) {
          final itemsCount = snapshot.data.movies.length;
          return Text('Items count: $itemsCount');
        }
        else {
          return Center(
            child: CircularProgressIndicator()
          );
        }
      },
    );
  }
}