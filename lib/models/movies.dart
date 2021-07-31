class Movie {
  final String imdbId;
  final String poster;
  final String title;
  final String year;

  Movie(
      {required this.imdbId,
      required this.poster,
      required this.title,
      required this.year});
  // ignore: non_constant_identifier_names
  factory Movie.fromJson(Map<String, dynamic> Json) {
    return Movie(
      imdbId: Json['imdbID'],
      poster: Json['Poster'],
      title: Json['Title'],
      year: Json['Year'],
    );
  }
}
