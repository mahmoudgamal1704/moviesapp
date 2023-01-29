import 'package:movieapp/base.dart';
import 'package:movieapp/screens/moviedetals/moviedetals_nav.dart';

import '../../models/MovieDetails.dart';
import '../../shared/network/remote/apimanager.dart';

class MovieDetailsViewModel extends BaseViewModel<MovieDetalsNav>{

  Future<MovieDetails> getmovieDetails(String id) async {
    MovieDetails movieDetails = (await ApiManager.getMovieDetals(id))!;
    return movieDetails;
  }

}