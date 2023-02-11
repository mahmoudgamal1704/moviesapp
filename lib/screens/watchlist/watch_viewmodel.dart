import 'package:movieapp/base.dart';
import 'package:movieapp/screens/watchlist/watch_nav.dart';

import '../../models/MovieDetails.dart';
import '../../shared/network/remote/apimanager.dart';

class WatchViewModel extends BaseViewModel<WatchNavigator> {
  List<MovieDetails> favMovies = [];

  @override
  void favmovies(String id) {
    navigator?.addRemoveWatchList(id);
    for(int i = 0 ; i< favMovies.length ; i++ ){
      if (favMovies[i].id.toString() == id){
        favMovies.removeAt(i);
        break;
      }
    }
    notifyListeners();
  }

  Future<void> getmovieDetails(List<String> moviesid) async {
    try {
      for (int i = 0; i < moviesid.length; i++) {
        MovieDetails movieDetails =
            (await ApiManager.getMovieDetals(moviesid[i]))!;
        favMovies.insert(favMovies.length, movieDetails);
      }
    } catch (err) {
      navigator!.showMessage('${err.toString()}');
    }

    notifyListeners();
  }
}
