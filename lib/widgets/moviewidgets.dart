import 'package:flutter/material.dart';

import 'package:movie/models/movies.dart';

class Movieswidget extends StatelessWidget {
  final List<Movie> movies;
  const Movieswidget({
    Key? key,
    required this.movies,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Scaffold(
            body: Container(height: 200, child: Text(movie.title)),
          );
        });
  }
}
