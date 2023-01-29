import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/models/MovieDetails.dart';
import 'package:movieapp/screens/moviedetals/moviedetals_nav.dart';

import 'moviedetals_viewmodel.dart';

class MovieDetalsScreen extends StatefulWidget {
  // const MovieDetalsScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetalsScreen> createState() => _MovieDetalsScreenState();
}

class _MovieDetalsScreenState
    extends BaseView<MovieDetalsScreen, MovieDetailsViewModel>
    implements MovieDetalsNav {
  @override
  Widget build(BuildContext context) {
    var movieid = ModalRoute.of(context)?.settings.arguments as String;
    return FutureBuilder(
      future: viewModel.getmovieDetails(movieid),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return Scaffold(
            appBar: AppBar(
              title: Text(
                snapshot.data!.title?? "",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
          );
        }else{
          return CircularProgressIndicator();
        }

      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  MovieDetailsViewModel initViewModel() {
    return MovieDetailsViewModel();
  }
}
