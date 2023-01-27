import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/screens/movies/movies_nav.dart';
import 'package:movieapp/screens/movies/movies_viewmodel.dart';

class MoviesScreen extends StatefulWidget {

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends BaseView<MoviesScreen,MoviesViewModel> implements MoviesNavigator{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow
    );
  }

  @override
  MoviesViewModel initViewModel() {
   return MoviesViewModel();
  }
}
