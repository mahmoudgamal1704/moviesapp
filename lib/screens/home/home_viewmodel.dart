import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/layouts/newreleaselayout.dart';
import 'package:movieapp/layouts/topratedlayout.dart';
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
    newwidgets = popularResponse.results?.map((e) => InkWell(onTap:() => navigator!.goToMovie((e)), child: NewReleaseLayout(e,this))).toList();
    return popularResponse;
  }
  Future<TopRatedResponse> getTopRatedMoviesresults() async {
    TopRatedResponse topRatedResponse = (await ApiManager.getTopRatedMovies())!;
    topwidgets = topRatedResponse.results?.map((e) => InkWell(onTap: (){ navigator!.goToMovie((e));} ,child: TopRatedLayout(e,this))).toList();
    return topRatedResponse;
  }
  Future<NowPlayingResponse> getNowPlayingMoviesresults() async {
    NowPlayingResponse nowPlayingResponse =
        (await ApiManager.getNowPlayingMovies())!;
    popwidgets = nowPlayingResponse.results?.map((e) => InkWell(onTap: (){ navigator!.goToMovie((e));},child: PopularLayout(e,this))).toList();
    return nowPlayingResponse;
  }
}
