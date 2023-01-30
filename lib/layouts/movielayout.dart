import 'package:flutter/material.dart';
import 'package:movieapp/screens/moviedetals/moviedetals_view.dart';

import '../models/basemodel.dart';




class MovieLayout extends StatelessWidget {
static const String routeName='MovieDetal';
  @override
  Widget build(BuildContext context) {
    var movie = ModalRoute.of(context)?.settings.arguments as Results;

    return  Scaffold(
      appBar: AppBar(
        title: Text(
         movie.title?? "",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: MovieDetalsScreen(movie.id.toString()),
    );
  }
}
