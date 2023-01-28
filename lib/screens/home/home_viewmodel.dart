import 'package:movieapp/base.dart';
import 'package:movieapp/models/PopularResponse.dart';
import 'package:movieapp/models/TopRatedResponse.dart';
import 'package:movieapp/screens/home/home_nav.dart';
import 'package:movieapp/shared/network/remote/apimanager.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator> {

   Future<PopularResponse> getpopularMoviesresults() async {
     PopularResponse popularResponse = (await ApiManager.getpopularMovies())!;
    return popularResponse;
  }

   Future<TopRatedResponse> getTopRatedMoviesresults() async {
     TopRatedResponse topRatedResponse = (await ApiManager.getTopRatedMovies())!;
     return topRatedResponse;
   }


// Future<NewReleaseResponse> getlatestMoviesresults() async {
   //   NewReleaseResponse newReleaseResponse = (await ApiManager.getlatestMovies())!;
   //   return newReleaseResponse;
   // }
}