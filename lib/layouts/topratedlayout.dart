import 'package:flutter/material.dart';
import 'package:movieapp/models/TopRatedResponse.dart';

import '../shared/items/constants.dart';

class TopRatedLayout extends StatelessWidget {
  // const TopRatedLayout({Key? key}) : super(key: key);
  Results result ;

TopRatedLayout(this.result);

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
                Container(
                  // color: Colors.red,
                  child: Image.network('${imagesServer}${result.posterPath}',fit: BoxFit.cover,),
                ),
                WatchListMark(),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.star,color: Color.fromRGBO(255, 187, 59, 1.0),),
              SizedBox(width: 10,),
              Text("${result.voteAverage}")
            ],
          ),
          Text("${result.title}"),
          Text("${result.releaseDate?.substring(0,4)}")


        ],
      ),
    );
  }
}