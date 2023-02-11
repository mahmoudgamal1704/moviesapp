
import 'package:movieapp/base.dart';
import 'package:movieapp/models/CategResponse.dart';
import 'package:movieapp/screens/movies/movies_nav.dart';

import '../../shared/network/remote/apimanager.dart';

class MoviesViewModel extends BaseViewModel<MoviesNavigator>{
List<Genres> categs =[];

  Future<void> getCategMoviesList() async {
    try{
      CategResponse categResponse = (await ApiManager.getCategMovies())!;
      categs= categResponse.genres!;
    }catch(err){
      navigator!.showMessage('${err.toString()}');
    }
    notifyListeners();

  }
}