import 'package:movieapp/base.dart';
import 'package:movieapp/models/FilteredMoviesResponse.dart';
import 'package:movieapp/models/basemodel.dart';
import 'package:movieapp/screens/filteredmovies/filteredmovied_nav.dart';

import '../../shared/network/remote/apimanager.dart';

class FilteredMoviesViewModel extends BaseViewModel<FilteredMoviesNavigator> {
  List<Results> filteredMovies = [];

  Future<void> getFilteredMoviesresults(String categid) async {
    try {
      FilteredMoviesResponse filteredMoviesResponse =
          (await ApiManager.getFilteredMovies(categid))!;
      filteredMovies = filteredMoviesResponse.results!;
    } catch (err) {
      navigator!.showMessage('${err.toString()}');
    }
    notifyListeners();
  }
}
