import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:movies/src/models/movies_collection.dart';

class MoviesApiService {
  Client _httpClient = Client();
  final _apiKey = '3c1e820e6f371ef378a86d4a036ad429';
  final _getMoviesUri = 'http://api.themoviedb.org/3/movie/popular'; 

  Future<MoviesCollection> getAllMovies() async {
    print('Start fetching movies');

    final fullUrl = '$_getMoviesUri?api_key=$_apiKey';
    final response = await _httpClient.get(fullUrl);

    if(response.statusCode == 200) {
      return MoviesCollection.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to fetch movies');
    }
  }
}