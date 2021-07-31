import 'package:flutter/cupertino.dart';
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
    return Card(
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: SizedBox(
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(movie.poster),
                  ),
                )),
          ),
          Expanded(
            flex: 2,
            child: title(movie: movie),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  onPressed: () {}, child: Icon(CupertinoIcons.heart_fill)),
            ),
          )
        ],
      ),
    );
  }
}

class title extends StatelessWidget {
  const title({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            movie.title,
            textScaleFactor: 1.3,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                movie.year,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        )
      ],
    );
  }
}
