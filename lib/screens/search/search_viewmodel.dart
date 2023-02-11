

import 'package:movieapp/base.dart';
import 'package:movieapp/models/SearchResponse.dart';
import 'package:movieapp/screens/search/search_nav.dart';

import '../../models/basemodel.dart';
import '../../shared/network/remote/apimanager.dart';

class SearchViewModel extends BaseViewModel<SearchNavigator>{

  List<Results> movies = [];
  Future<void> getSearchMoviesresults(String query) async {
    try{
      SearchResponse searchResponse = (await ApiManager.getSearchMovies(query))!;
      movies=  searchResponse.results!;
    }catch(err){
      navigator!.showMessage('${err.toString()}');
    }
    notifyListeners();

  }
}