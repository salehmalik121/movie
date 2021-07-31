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
          return ListTile(
            title: Display(movie: movie),
          );
        });
  }
}

class Display extends StatelessWidget {
  const Display({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 150, child: Image.network(movie.poster)),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                movie.title,
                textScaleFactor: 1.3,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ],
    );
  }
}
