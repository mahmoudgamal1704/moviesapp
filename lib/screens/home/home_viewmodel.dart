import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/layouts/newreleaselayout.dart';
import 'package:movieapp/layouts/topratedlayout.dart';
import 'package:movieapp/models/MovieDetails.dart';
import 'package:movieapp/models/NowPlayingResponse.dart';
import 'package:movieapp/models/PopularResponse.dart';
import 'package:movieapp/models/TopRatedResponse.dart';
import 'package:movieapp/screens/home/home_nav.dart';
import 'package:movieapp/shared/network/remote/apimanager.dart';

import '../../layouts/popularlayout.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  List<Widget>? popwidgets;
  List<Widget>? newwidgets;
  List<Widget>? topwidgets;
  Future<PopularResponse> getpopularMoviesresults() async {
    PopularResponse popularResponse = (await ApiManager.getpopularMovies())!;
    newwidgets = popularResponse.results?.map((e) => InkWell(onTap: (){ navigator!.goToMovie((e.id.toString()));}, child: NewReleaseLayout(e))).toList();
    return popularResponse;
  }
  Future<TopRatedResponse> getTopRatedMoviesresults() async {
    TopRatedResponse topRatedResponse = (await ApiManager.getTopRatedMovies())!;
    topwidgets = topRatedResponse.results?.map((e) => InkWell(onTap: (){ navigator!.goToMovie((e.id.toString()));} ,child: TopRatedLayout(e))).toList();
    return topRatedResponse;
  }
  // Future<MovieDetails> getmovieDetails(String id) async {
  //   MovieDetails movieDetails = (await ApiManager.getMovieDetals(id))!;
  //   // topwidgets = topRatedResponse.results?.map((e) => TopRatedLayout(e)).toList();
  //   return movieDetails;
  // }

  Future<NowPlayingResponse> getNowPlayingMoviesresults() async {
    NowPlayingResponse nowPlayingResponse =
        (await ApiManager.getNowPlayingMovies())!;
    popwidgets = nowPlayingResponse.results?.map((e) => InkWell(onTap: (){ navigator!.goToMovie((e.id.toString()));},child: PopularLayout(e))).toList();
    return nowPlayingResponse;
  }

}
