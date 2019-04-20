import 'package:flutter/material.dart';
import 'package:movies/src/ui/movies/movies_gallery.dart';

class MoviesView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Movies'),
      ),
      body: MoviesGallery()
    );
  }  
}