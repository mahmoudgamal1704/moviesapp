
import 'package:movieapp/base.dart';
import 'package:movieapp/screens/watchlist/watch_nav.dart';

import '../../models/MovieDetails.dart';
import '../../shared/network/remote/apimanager.dart';

class WatchViewModel extends BaseViewModel<WatchNavigator>{



Future<List<MovieDetails>> getmovieDetails(List<int> moviesid) async {
  List<MovieDetails> favMovies =[];
  for(int i = 0 ; i< moviesid.length ; i++ ){
    MovieDetails movieDetails = (await ApiManager.getMovieDetals(moviesid[i].toString()))!;
    favMovies.insert(favMovies.length, movieDetails);
  }
  return favMovies;
}

}