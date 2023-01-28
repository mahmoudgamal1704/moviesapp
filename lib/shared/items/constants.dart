
import 'package:flutter/material.dart';

const String BASE = 'api.themoviedb.org';
const String APIKEY = '070a8fbba8968dea6e4a9aca8a217ef0';

const String popularEndPoint = '/3/movie/popular';

const String latestEndPoint = '/3/movie/latest';
const String top_ratedEndPoint = '/3/movie/top_rated';
const String imagesServer ='https://image.tmdb.org/t/p/original';
Widget CheckAPIdata (AsyncSnapshot snapshot) {
  if(snapshot.connectionState ==ConnectionState.waiting){
    return CircularProgressIndicator();
  }
  if(snapshot.hasError ) {
    return Text('Error');
  }
  if (snapshot.data?.status != "ok") {
    return Text( '${snapshot.data?.message??"Err"}');
  }
  return Text('data');
}