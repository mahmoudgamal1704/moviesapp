import 'package:flutter/material.dart';
import 'package:movieapp/models/PopularResponse.dart';

class PopularLayout extends StatelessWidget {
Results movie;


PopularLayout(this.movie);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: Text(movie.id.toString()??""),
    );
  }
}
