import 'package:flutter/material.dart';
import 'package:movieapp/models/PopularResponse.dart';

import '../models/basemodel.dart';
import '../screens/home/home_viewmodel.dart';
import '../shared/items/constants.dart';

class NewReleaseLayout extends StatefulWidget {
  // const NewReleaseLayout({Key? key}) : super(key: key);
Results result;
HomeViewModel viewmodel;
NewReleaseLayout(this.result,this.viewmodel);

  @override
  State<NewReleaseLayout> createState() => _NewReleaseLayoutState();
}

class _NewReleaseLayoutState extends State<NewReleaseLayout> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                // flex: 3,
                child: Container(
                  child: CachedImage('${imagesServer}${widget.result.posterPath}')
                  // Image.network('${imagesServer}${widget.result.posterPath}',fit: BoxFit.fill,),

                ),
              ),
            ],
          ),
        ),
        InkWell(
            onTap: () {
        widget.viewmodel.favmovies(widget.result.id!.toString());

        },
            child: WatchListMark(movieid: widget.result.id!.toString()))
      ],
    );
  }
}
