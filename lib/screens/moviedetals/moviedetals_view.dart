import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/screens/moviedetals/moviedetals_nav.dart';

import 'moviedetals_viewmodel.dart';

class MovieDetalsScreen extends StatefulWidget {
  // const MovieDetalsScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetalsScreen> createState() => _MovieDetalsScreenState();
}

class _MovieDetalsScreenState extends BaseView<MovieDetalsScreen,MovieDetailsViewModel> implements MovieDetalsNav{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("d",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
    );
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;
  }
  @override
  MovieDetailsViewModel initViewModel() {
    return MovieDetailsViewModel();
  }
}
