import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/models/MovieDetails.dart';
import 'package:movieapp/screens/moviedetals/moviedetals_nav.dart';
import 'package:movieapp/shared/items/constants.dart';

import 'moviedetals_viewmodel.dart';

class MovieDetalsScreen extends StatefulWidget {
  // const MovieDetalsScreen({Key? key}) : super(key: key);
  String? id;

  MovieDetalsScreen(this.id);

  @override
  State<MovieDetalsScreen> createState() => _MovieDetalsScreenState();
}

class _MovieDetalsScreenState
    extends BaseView<MovieDetalsScreen, MovieDetailsViewModel>
    implements MovieDetalsNav {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: viewModel.getmovieDetails(widget.id ?? ""),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  int moviehour = (snapshot.data!.runtime! / 60).toInt();
                  // var movietime = ((snapshot.data!.runtime! / 60) + (snapshot.data!.runtime! % 60)).toString() ;
                  var movietime =
                      '${moviehour}  h  ${snapshot.data!.runtime! % 60}  m';
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Image.network(
                        '${imagesServer + snapshot.data!.backdropPath!}',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      )),
                      SizedBox(height: 15,),
                      Text('${snapshot.data!.title!}'),
                      SizedBox(height: 15,),

                      Text(
                          '${snapshot.data!.releaseDate!.substring(0, 4)}  ${movietime}'),
                      SizedBox(height: 15,),

                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                    '${imagesServer + snapshot.data!.posterPath!}',width: 120,),
                                WatchListMark()
                              ],
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin:EdgeInsets.only(bottom: 10),
                                    // height: 50,
                                    // color:Colors.red,
                                    child: GridView.builder(
                                      // clipBehavior: Clip.antiAlias,
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.genres!.length,
                                      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 16/9,
                                        mainAxisExtent:30,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.white),
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Text('${snapshot.data!.genres![index].name}'),
                                        );
                                      },),
                                  ),
                                  Text('${snapshot.data!.overview}'),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Icon(Icons.star,color: Color.fromRGBO(255, 187, 59, 1.0),),
                                        SizedBox(width: 10,),
                                        Text("${snapshot.data!.voteAverage}")
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ),
                      SizedBox(height: 20,),
                      Expanded(child: Container(color: Colors.red,))
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  MovieDetailsViewModel initViewModel() {
    return MovieDetailsViewModel();
  }
}
