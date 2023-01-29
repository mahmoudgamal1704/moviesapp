import 'package:flutter/material.dart';
import 'package:movieapp/shared/items/constants.dart';
import '../models/NowPlayingResponse.dart';

class PopularLayout extends StatelessWidget {
  Results movie;

  PopularLayout(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 4,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      '${imagesServer}${movie.backdropPath}',
                      fit: BoxFit.fitWidth,
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 150, bottom: 5),
                  child: Text('${movie.title ?? ""}')),
              Container(
                  margin: EdgeInsets.only(left: 150),
                  child: Text('${movie.releaseDate?.substring(0, 4) ?? ""}')),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 30),
                height: 150,
                width: MediaQuery.of(context).size.width * .25,
                child: Image.network(
                  '${imagesServer}${movie.posterPath}',
                  fit: BoxFit.fill,
                ),
              ),
              WatchListMark(leftmargin: 20, topmargin: 30)
            ],
          ),
        ],
      ),
    );
  }
}
