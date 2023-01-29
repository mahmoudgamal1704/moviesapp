import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/screens/home/home_viewmodel.dart';


const String BASE = 'api.themoviedb.org';
const String APIKEY = '070a8fbba8968dea6e4a9aca8a217ef0';
const String latestEndPoint = '/3/movie/latest';
const String top_ratedEndPoint = '/3/movie/top_rated';
const String movieDetailsEndPoint = '/3/movie/';
const String imagesServer ='https://image.tmdb.org/t/p/original';
const String popularEndPoint = '/3/movie/popular';
const String NowPlayingEndPoint = '/3/movie/now_playing';



Widget FutureBuilderAPI (Function  getdata ,HomeViewModel datalist,CarouselOptions options,String layoutType) {
  return FutureBuilder (
    future:  getdata(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return CarouselSlider(
          items: layoutType=="now" ? datalist.popwidgets:layoutType=="new" ? datalist.newwidgets:datalist.topwidgets,
          options: options,
        );
      } else {
        return Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
      }
    },
  );
}
Widget WatchListMark ({double topmargin = 0, double leftmargin = 0}){
return Stack(
  children: [
    Container(
      margin: EdgeInsets.only(left: leftmargin,top: topmargin),
        child: ImageIcon(
          AssetImage('assets/images/bookmark.png'),
          // color: Color.fromRGBO(247, 181, 57, 1.0),
          color: Color.fromRGBO(81, 79, 79, 1.0),
        )),
    Container(
        margin: EdgeInsets.only(left: leftmargin+4,top: topmargin),
        child: Icon(
          Icons.add,
          size: 15,
        ))
  ],
);
}

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