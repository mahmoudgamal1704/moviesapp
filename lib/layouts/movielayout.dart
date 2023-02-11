import 'package:flutter/material.dart';
import 'package:movieapp/screens/moviedetals/moviedetals_view.dart';
import 'package:movieapp/screens/moviedetals/moviedetals_viewmodel.dart';
import 'package:provider/provider.dart';

import '../models/basemodel.dart';
import '../screens/search/search_viewmodel.dart';




class MovieLayout extends StatelessWidget {
static const String routeName='MovieDetal';
  @override
  Widget build(BuildContext context) {
    var movie = ModalRoute.of(context)?.settings.arguments as Results;

    return  ChangeNotifierProvider(
      create: (context) => MovieDetailsViewModel(),
      builder: (context, child) {
        var moviemodel=Provider.of<MovieDetailsViewModel>(context);
        moviemodel.getmovieDetails(movie.id.toString());
        moviemodel.getSimilarMovies(movie.id.toString());
        return Scaffold(
          appBar: AppBar(
            title: Text(
              movie.title?? "",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: MovieDetalsScreen(moviemodel.movie,moviemodel.movietime,moviemodel.similarmovies),
        ) ;
      },
    );
  }
}
