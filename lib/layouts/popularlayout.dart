import 'package:flutter/material.dart';
import 'package:movieapp/models/PopularResponse.dart';

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
                    color: Colors.yellow,
                  )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 150),
                      child: Text('${movie.title ?? ""}'))),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                height: 150,
                width: MediaQuery.of(context).size.width * .25,
                color: Colors.red,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: ImageIcon(
                    AssetImage('assets/images/bookmark.png'),
                    // color: Color.fromRGBO(247, 181, 57, 1.0),
                    color: Color.fromRGBO(81, 79, 79, 1.0),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 24, top: 22),
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
