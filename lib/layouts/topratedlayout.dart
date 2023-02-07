import 'package:flutter/material.dart';
import 'package:movieapp/models/TopRatedResponse.dart';

import '../models/basemodel.dart';
import '../screens/home/home_viewmodel.dart';
import '../screens/moviedetals/moviedetals_viewmodel.dart';
import '../shared/items/constants.dart';

class TopRatedLayout extends StatefulWidget {
  // const TopRatedLayout({Key? key}) : super(key: key);
  Results result ;
  HomeViewModel viewmodel;

TopRatedLayout(this.result,this.viewmodel);

  @override
  State<TopRatedLayout> createState() => _TopRatedLayoutState();
}

class _TopRatedLayoutState extends State<TopRatedLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // flex: 3,
            child: Stack(
              children: [
                Image.network('${imagesServer}${widget.result.posterPath}',fit: BoxFit.cover,),
                InkWell(
                    onTap: () {
                          widget.viewmodel.navigator!
                              .addRemoveWatchList(widget.result.id!.toString());
                          setState(() {

                          });
                        },
                    child: WatchListMark(movieid: widget.result.id!.toString())),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.star,color: Color.fromRGBO(255, 187, 59, 1.0),),
              SizedBox(width: 10,),
              Text("${widget.result.voteAverage}")
            ],
          ),
          Text("${widget.result.title}"),
          Text("${widget.result.releaseDate?.substring(0,4)}")


        ],
      ),
    );
  }
}
