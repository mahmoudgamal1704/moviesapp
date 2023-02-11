import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/layouts/movielayout.dart';
import 'package:movieapp/layouts/similarlayout.dart';
import 'package:movieapp/layouts/topratedlayout.dart';
import 'package:movieapp/models/MovieDetails.dart';
import 'package:movieapp/screens/moviedetals/moviedetals_nav.dart';
import 'package:movieapp/shared/items/constants.dart';

import '../../models/basemodel.dart';
import 'moviedetals_viewmodel.dart';

class MovieDetalsScreen extends StatefulWidget {
  // const MovieDetalsScreen({Key? key}) : super(key: key);
  MovieDetails movie;
  String movietime;
List<Results> similarmovies;
  MovieDetalsScreen(this.movie, this.movietime,this.similarmovies);

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
            flex: 2,
            child: Column(
              children: [
                Expanded(
                    child: widget.movie.backdropPath == null
                        ? Image.asset('assets/images/nomovieicon.png')
                        : CachedImage(
                            '${imagesServer + widget.movie.backdropPath!}')),
                SizedBox(
                  height: 15,
                ),
                Text('${widget.movie.title ?? ''}'),
                SizedBox(
                  height: 15,
                ),
                Text(
                    '${widget.movie.releaseDate?.substring(0, 4)}  ${widget.movietime}'),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          widget.movie.posterPath ==null ? Image.asset('assets/images/nomovieicon.png'):
                          CachedImage(
                            '${imagesServer + widget.movie.posterPath!}',
                          ),
                          InkWell(
                              onTap: () {
                                viewModel.navigator!.addRemoveWatchList(
                                    widget.movie.id!.toString());
                                setState(() {});
                              },
                              child: widget.movie.id ==null ? CircularProgressIndicator():
                              WatchListMark(
                                  movieid: widget.movie.id!.toString()))
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            widget.movie.genres ==null ? CircularProgressIndicator() :
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: widget.movie.genres!.length ,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 16 / 9,
                                  mainAxisExtent: 30,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                        '${widget.movie.genres![index].name}'),
                                  );
                                },
                              ),
                            ),
                            Expanded(child: Text('${widget.movie.overview}')),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(255, 187, 59, 1.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("${widget.movie.voteAverage}")
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('More Like This'),
                  Expanded(
                      child: CarouselSlider(
                        items: widget.similarmovies.map((e) {
                          return InkWell(
                              onTap: () {
                                viewModel.navigator!
                                    .goToMovieDetails(e);
                              },
                              child: SimilarLayout(e, viewModel));
                        }).toList(),
                        options: CarouselOptions(
                          padEnds: false,
                          enableInfiniteScroll: false,
                          disableCenter: true,
                          viewportFraction: .4,
                          height: MediaQuery.of(context).size.width,
                          enlargeStrategy:
                          CenterPageEnlargeStrategy.height,
                          enlargeCenterPage: false,
                        ),
                      )
                  )
                ],
              ))
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

  @override
  goToMovieDetails(movie) {
    // TODO: implement goToMovieDetails
    Navigator.pushReplacementNamed(context, MovieLayout.routeName,
        arguments: movie);
  }
}
