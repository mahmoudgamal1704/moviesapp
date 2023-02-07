import 'package:flutter/material.dart';
import 'package:movieapp/models/MovieDetails.dart';
import 'package:movieapp/models/basemodel.dart';

import '../shared/items/constants.dart';

class WatchListLayout extends StatelessWidget {
  // const SearchLayout({Key? key}) : super(key: key);
  MovieDetails movie;

  WatchListLayout(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          movie.posterPath != null
              ? Image.network(imagesServer + movie.posterPath!)
              : movie.backdropPath != null
              ? Image.network(imagesServer + movie.backdropPath!)
              : Image.asset('assets/images/nomovieicon.png'),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text('${movie.title ?? ''}')),
                  Expanded(child: Text(movie.releaseDate != "" ? movie.releaseDate!.substring(0, 4) : '')),
                  movie.overview!.length > 0 ? Text('${movie.overview?.substring(0,15)}') : Text(''),
                ],
              ))
        ],
      ),
    );
  }
}
