import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movieapp/models/NowPlayingResponse.dart';
import 'package:movieapp/models/TopRatedResponse.dart';

import '../../../models/MovieDetails.dart';
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

  static  Future<NowPlayingResponse?> getNowPlayingMovies() async {
    Uri uri = Uri.https(BASE,NowPlayingEndPoint,{"api_key" : APIKEY,"language":"en-US","page" : "1"});
    Response response = await http.get(uri);
    if (response.statusCode ==200){
      var json = jsonDecode(response.body);
      return NowPlayingResponse.fromJson(json);
    }else {
      return null;
    }
  }

  static  Future<TopRatedResponse?> getTopRatedMovies() async {
    Uri uri = Uri.https(BASE,top_ratedEndPoint,{"api_key" : APIKEY,"language":"en-US","page" : "1"});
    Response response = await http.get(uri);
    if (response.statusCode ==200){
      var json = jsonDecode(response.body);
      return TopRatedResponse.fromJson(json);
    }else {
      return null;
    }
  }

  static  Future<MovieDetails?> getMovieDetals(String id) async {
    Uri uri = Uri.https(BASE,'${movieDetailsEndPoint+id}',{"api_key" : APIKEY,"language":"en-US","page" : "1"});
    Response response = await http.get(uri);
    if (response.statusCode ==200){
      var json = jsonDecode(response.body);
      return MovieDetails.fromJson(json);
    }else {
      return null;
    }
  }


}