import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/layouts/newreleaselayout.dart';
import 'package:movieapp/layouts/topratedlayout.dart';
import 'package:movieapp/models/NowPlayingResponse.dart';
import 'package:movieapp/models/PopularResponse.dart';
import 'package:movieapp/models/TopRatedResponse.dart';
import 'package:movieapp/models/basemodel.dart';
import 'package:movieapp/screens/home/home_nav.dart';
import 'package:movieapp/shared/network/remote/apimanager.dart';

import '../../layouts/popularlayout.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator> {

  List<Results> popularmovies =[];
  List<Results> newmovies =[];
  List<Results> topmovies =[];
void favmovies(String id ){
  print('dd');
  navigator?.addRemoveWatchList(id);
  notifyListeners();
}

  Future<void> getpopularMoviesresults() async {
    try{
      PopularResponse popularResponse = (await ApiManager.getpopularMovies())!;
      popularmovies = popularResponse.results! ;
    }catch (err) {
      navigator!.showMessage("${err.toString()}");
    }
    notifyListeners();
  }
  Future<void> getTopRatedMoviesresults() async {
    try{
      TopRatedResponse topRatedResponse = (await ApiManager.getTopRatedMovies())!;
      // topwidgets = topRatedResponse.results?.map((e) => InkWell(onTap: (){ navigator!.goToMovie((e));} ,child: TopRatedLayout(e,this))).toList();
      topmovies= topRatedResponse.results!;
    }catch (err){
      navigator!.showMessage("${err.toString()}");
    }
    notifyListeners();

  }
  Future<void> getNowPlayingMoviesresults() async {
    try{
      NowPlayingResponse nowPlayingResponse =
      (await ApiManager.getNowPlayingMovies())!;
      // popwidgets = nowPlayingResponse.results?.map((e) => InkWell(onTap: (){ navigator!.goToMovie((e));},child: PopularLayout(e,this))).toList();
      newmovies = nowPlayingResponse.results!;
    }catch (err){
      navigator!.showMessage("${err.toString()}");

    }
    notifyListeners();

  }
}
