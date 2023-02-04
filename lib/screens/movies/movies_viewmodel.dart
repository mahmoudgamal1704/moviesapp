
import 'package:movieapp/base.dart';
import 'package:movieapp/models/CategResponse.dart';
import 'package:movieapp/screens/movies/movies_nav.dart';

import '../../shared/network/remote/apimanager.dart';

class MoviesViewModel extends BaseViewModel<MoviesNavigator>{

  Future<CategResponse> getCategMoviesList() async {
    CategResponse categResponse = (await ApiManager.getCategMovies())!;
    return categResponse;
  }
}