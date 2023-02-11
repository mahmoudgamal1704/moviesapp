import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
/////////////////////////////////////////////
const String BASE = 'api.themoviedb.org';
const String APIKEY = '070a8fbba8968dea6e4a9aca8a217ef0';
const String latestEndPoint = '/3/movie/latest';
const String top_ratedEndPoint = '/3/movie/top_rated';
const String movieDetailsEndPoint = '/3/movie/';
const String imagesServer ='https://image.tmdb.org/t/p/original';
const String popularEndPoint = '/3/movie/popular';
const String NowPlayingEndPoint = '/3/movie/now_playing';
const String SearchEndPoint = '/3/search/movie';
const String CategEndPoint = '/3/genre/movie/list';
const String FilteredmoviesEndPoint = '/3/discover/movie';
// Obtain shared preferences.

SharedPreferences? prefs ;
// Future<void> initSharedPreferences () async {
//   prefs = await  SharedPreferences.getInstance();
// }
late List<String> ids;
void getWatchListIds(){
  ids = prefs?.getStringList('favmovies') ?? [];
}

checkWatchList (int movieid){
getWatchListIds();
if (LinearSearch(ids.map((e) => int.parse(e)).toList(), movieid)){
  return ids.indexOf(movieid.toString());
}else {
  return -1;
}
}

bool LinearSearch(List<int> arr, int userValue) {
 for(int i =0 ; i < arr.length;i++){
   if (userValue==arr[i]){
     return true;
   }
 }
 return false;
}
Widget CachedImage (String imageurl){
  return CachedNetworkImage(
    imageUrl: imageurl ?? "",
    fit: BoxFit.fill,
    // height: 180,
    placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.white,)),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
Widget WatchListMark ( {double topmargin = 0, double leftmargin = 0,required String movieid}){
  return Stack(
    children: [
      Container(
          margin: EdgeInsets.only(left: leftmargin,top: topmargin),
          child: ImageIcon(
            AssetImage('assets/images/bookmark.png'),
            // color: Color.fromRGBO(247, 181, 57, 1.0),
            color:checkWatchList(int.parse(movieid)) >= 0 ? Color.fromRGBO(247, 181, 57, 1.0) :Color.fromRGBO(
                81, 79, 79, 1.0) ,
          )),
      Container(
          margin: EdgeInsets.only(left: leftmargin+4,top: topmargin),
          child: Icon(
            checkWatchList(int.parse(movieid)) >= 0 ? Icons.check :Icons.add,
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