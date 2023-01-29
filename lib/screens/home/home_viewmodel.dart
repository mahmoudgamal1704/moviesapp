import 'package:flutter/cupertino.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/layouts/newreleaselayout.dart';
import 'package:movieapp/layouts/topratedlayout.dart';
import 'package:movieapp/models/NowPlayingResponse.dart';
import 'package:movieapp/models/NowPlayingResponse.dart' as results;
import 'package:movieapp/models/PopularResponse.dart';
import 'package:movieapp/models/TopRatedResponse.dart';
import 'package:movieapp/screens/home/home_nav.dart';
import 'package:movieapp/shared/network/remote/apimanager.dart';

import '../../layouts/popularlayout.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  // List<results.Results>? nowPlayResult;
  List<Widget>? popwidgets;
  List<Widget>? newwidgets;
  List<Widget>? topwidgets;
  Future<PopularResponse> getpopularMoviesresults() async {
    PopularResponse popularResponse = (await ApiManager.getpopularMovies())!;
    newwidgets = popularResponse.results?.map((e) => NewReleaseLayout(e)).toList();
    return popularResponse;
  }
  Future<TopRatedResponse> getTopRatedMoviesresults() async {
    TopRatedResponse topRatedResponse = (await ApiManager.getTopRatedMovies())!;
    topwidgets = topRatedResponse.results?.map((e) => TopRatedLayout(e)).toList();
    return topRatedResponse;
  }

  Future<NowPlayingResponse> getNowPlayingMoviesresults() async {
    NowPlayingResponse nowPlayingResponse =
        (await ApiManager.getNowPlayingMovies())!;
    // nowPlayResult = nowPlayingResponse.results;
    popwidgets = nowPlayingResponse.results?.map((e) => PopularLayout(e)).toList();
    // print('${widgets?.length} hj');
    return nowPlayingResponse;
  }

// Future<NewReleaseResponse> getlatestMoviesresults() async {
//   NewReleaseResponse newReleaseResponse = (await ApiManager.getlatestMovies())!;
//   return newReleaseResponse;
// }
}
