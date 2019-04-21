import 'package:flutter/material.dart';
import 'package:movies/src/blocs/movies_bloc.dart';
import 'package:movies/src/models/movies_collection.dart';

class MoviesView extends StatelessWidget {
  final _moviesBloc = MoviesBloc();
  get moviesStream => _moviesBloc.movies;

  MoviesView() {
    //_moviesBloc.getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Movies'),
      ),
      body: _buildBody()
    );
  }

  StreamBuilder<MoviesCollection> _buildBody() {
    
    _moviesBloc.getAllMovies();
    return StreamBuilder(
      stream: moviesStream,
      builder: (context, AsyncSnapshot<MoviesCollection> snapshot) {
        if (snapshot.hasData) {
          return _buildGallery(snapshot);
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

  Widget _buildGallery(AsyncSnapshot<MoviesCollection> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.movies.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemBuilder: (BuildContext context, int index) {
        return getPosterOverNetwork(snapshot, index);
      },
    );
  }

  getPosterOverNetwork(AsyncSnapshot<MoviesCollection> snapshot, int index) {
    final baseUri = 'https://image.tmdb.org/t/p/w185';
    final posterUri = snapshot.data.movies[index].posterPath;
    final fullPosterUrl = baseUri + posterUri;

    return Image.network(
      fullPosterUrl,
      fit: BoxFit.cover
    );
  }  
}