import 'package:flutter/material.dart';
import 'package:movies/src/ui/movies/movies_view.dart';

class App extends StatelessWidget {
    
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
                body: MoviesView(),
            )
        );
    }
}