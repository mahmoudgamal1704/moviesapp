import 'package:flutter/material.dart';
import 'package:movieapp/models/PopularResponse.dart';
import 'package:movieapp/shared/items/constants.dart';

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
                    child: Image.network('${imagesServer}${movie.backdropPath}',fit: BoxFit.fitWidth,),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 150,bottom: 5),
                  child: Text('${movie.title ?? ""}')),
              Container(
                  margin: EdgeInsets.only(left: 150),
                  child: Text('${movie.releaseDate?.substring(0,4) ?? ""}')),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 30),
                height: 150,
                width: MediaQuery.of(context).size.width * .25,
                // color: Colors.red,
                child: Image.network('${imagesServer}${movie.posterPath}',fit: BoxFit.fill,),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, top: 30),
                  child: ImageIcon(
                    AssetImage('assets/images/bookmark.png'),
                    // color: Color.fromRGBO(247, 181, 57, 1.0),
                    color: Color.fromRGBO(81, 79, 79, 1.0),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 24, top: 32),
                  child: Icon(
                    Icons.add,
                    size: 15,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
