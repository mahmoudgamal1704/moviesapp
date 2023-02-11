import 'package:flutter/material.dart';
import 'package:movieapp/shared/items/constants.dart';
import '../models/NowPlayingResponse.dart';
import '../models/basemodel.dart';
import '../screens/home/home_viewmodel.dart';

class PopularLayout extends StatefulWidget {
  Results movie;
  HomeViewModel viewmodel;

  PopularLayout(this.movie,this.viewmodel);

  @override
  State<PopularLayout> createState() => _PopularLayoutState();
}

class _PopularLayoutState extends State<PopularLayout> {
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
                    child: CachedImage('${imagesServer}${widget.movie.backdropPath}')
                    // Image.network(
                    //   '${imagesServer}${widget.movie.backdropPath}',
                    //   fit: BoxFit.fitWidth,
                    // ),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 150, bottom: 5),
                  child: Text('${widget.movie.title ?? ""}')),
              Container(
                  margin: EdgeInsets.only(left: 150),
                  child: Text('${widget.movie.releaseDate?.substring(0, 4) ?? ""}')),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 30),
                height: 150,
                width: MediaQuery.of(context).size.width * .25,
                child: CachedImage('${imagesServer}${widget.movie.posterPath}')
                // Image.network(
                //   '${imagesServer}${widget.movie.posterPath}',
                //   fit: BoxFit.fill,
                // ),
              ),
              InkWell(
                  onTap:() {
                    widget.viewmodel.favmovies(widget.movie.id!.toString());

                  },
                  child: WatchListMark(leftmargin: 20, topmargin: 30,movieid: widget.movie.id!.toString()))
            ],
          ),
        ],
      ),
    );
  }
}
