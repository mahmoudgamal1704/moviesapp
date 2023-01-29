import 'package:flutter/material.dart';
import 'package:movieapp/models/PopularResponse.dart';

import '../shared/items/constants.dart';

class NewReleaseLayout extends StatelessWidget {
  // const NewReleaseLayout({Key? key}) : super(key: key);
Results result;

NewReleaseLayout(this.result);

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
                  color: Colors.red,
                  child: Image.network('${imagesServer}${result.posterPath}',fit: BoxFit.fill,),

                ),
              ),
            ],
          ),
        ),
        WatchListMark()
      ],
    );
  }
}
