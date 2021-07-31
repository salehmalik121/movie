import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/models/movies.dart';
import 'package:movie/widgets/moviewidgets.dart';

void main() {
  print("runned");
  runApp(MovieApp());
}

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  List<Movie> _movies = <Movie>[];
  @override
  initState() {
    super.initState();
    _populateMovies();
  }

  void _populateMovies() async {
    var movies = await loadData();
    setState(() {
      _movies = movies;
    });
  }

  loadData() async {
    var apiCall = await http.get(
        Uri.parse("https://www.omdbapi.com/?s=batman&page=1&apikey=2c8219b0"));

    if (apiCall.statusCode == 200) {
      var rawData = jsonDecode(apiCall.body);
      Iterable list = rawData['Search'];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Error ${apiCall.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Movie App"),
            ),
            body: Container(child: Movieswidget(movies: _movies))));
  }
}
