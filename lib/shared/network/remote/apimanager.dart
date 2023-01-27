import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../models/PopularResponse.dart';
import '../../items/constants.dart';

class ApiManager {
  static  Future<PopularResponse?> getpopularMovies() async {
    Uri uri = Uri.https(BASE,popularEndPoint,{"api_key" : APIKEY,"language":"en-US","page" : "1"});
    Response response = await http.get(uri);
    if (response.statusCode ==200){
      var json = jsonDecode(response.body);
      return PopularResponse.fromJson(json);
    }else {
      return null;
    }


}
}