import 'package:movieapp/base.dart';
import 'package:movieapp/models/SearchResponse.dart';
import 'package:movieapp/screens/search/search_nav.dart';

import '../../shared/network/remote/apimanager.dart';

class SearchViewModel extends BaseViewModel<SearchNavigator>{
  Future<SearchResponse> getSearchMoviesresults(String query) async {
    SearchResponse searchResponse = (await ApiManager.getSearchMovies(query))!;
    // newwidgets = popularResponse.results?.map((e) => InkWell(onTap: (){ navigator!.goToMovie((e));}, child: NewReleaseLayout(e))).toList();
    return searchResponse;
  }
}