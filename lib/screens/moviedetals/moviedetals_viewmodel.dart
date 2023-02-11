import 'package:movieapp/base.dart';
import 'package:movieapp/models/MovieLikeResponse.dart';
import 'package:movieapp/models/basemodel.dart';
import 'package:movieapp/screens/moviedetals/moviedetals_nav.dart';

import '../../models/MovieDetails.dart';
import '../../shared/network/remote/apimanager.dart';

class MovieDetailsViewModel extends BaseViewModel<MovieDetalsNav>{
  MovieDetails movie =MovieDetails();
  List<Results> similarmovies =[];
  var movietime ='';


  Future<void> getmovieDetails(String id) async {
    try{ MovieDetails movieDetails = (await ApiManager.getMovieDetals(id))!;
    movie = movieDetails;
    int moviehour = (movie.runtime! / 60).toInt();
     movietime =
        '${moviehour}  h  ${movie.runtime! % 60}  m';
    }catch (err){
      navigator!.showMessage('${err.toString()}');
    }
   notifyListeners();
  }
  Future<void> getSimilarMovies(String id) async {
    try{
      MovieLikeResponse movieLikeResponse = (await ApiManager.getlikeMovies(id))!;
      similarmovies = movieLikeResponse.results!;
    }catch (err){
      navigator!.showMessage('${err.toString()}');
    }

  }
}