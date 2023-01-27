
import 'package:flutter/material.dart';

const String BASE = 'https://api.themoviedb.org/3';
const String APIKEY = '070a8fbba8968dea6e4a9aca8a217ef0';

const String popularEndPoint = '/movie/popular';

const String latestEndPoint = '/movie/latest';
const String top_ratedEndPoint = '/movie/top_rated';

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