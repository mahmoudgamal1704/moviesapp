

import 'package:movieapp/base.dart';
import 'package:movieapp/models/FilteredMoviesResponse.dart';
import 'package:movieapp/screens/filteredmovies/filteredmovied_nav.dart';

import '../../shared/network/remote/apimanager.dart';

class FilteredMoviesViewModel extends BaseViewModel<FilteredMoviesNavigator>{


  Future<FilteredMoviesResponse> getFilteredMoviesresults(String categid) async {
    FilteredMoviesResponse filteredMoviesResponse =
    (await ApiManager.getFilteredMovies(categid))!;
    // popwidgets = nowPlayingResponse.results?.map((e) => InkWell(onTap: (){ navigator!.goToMovie((e));},child: PopularLayout(e))).toList();
    return filteredMoviesResponse;
  }
}