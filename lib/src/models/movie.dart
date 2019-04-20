class Movie {
  int id;
  String title;
  String posterPath;

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    posterPath = parsedJson['poster_path'];
  }
}