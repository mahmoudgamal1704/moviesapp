import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/layouts/movielayout.dart';
import 'package:movieapp/layouts/newreleaselayout.dart';
import 'package:movieapp/layouts/popularlayout.dart';
import 'package:movieapp/layouts/topratedlayout.dart';
import 'package:movieapp/models/PopularResponse.dart';
import 'package:movieapp/screens/home/home_nav.dart';
import 'package:movieapp/screens/home/home_viewmodel.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:movieapp/shared/items/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel()
        ..getpopularMoviesresults()
        ..getTopRatedMoviesresults()
        ..getNowPlayingMoviesresults(),
      builder: (context, child) {
        print('ag');
        var homemodel = Provider.of<HomeViewModel>(context);
        return Container(
          width: MediaQuery.of(context).size.width,
          // color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: homemodel.newmovies.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                    : CarouselSlider(
                        items: homemodel.newmovies
                            .map((movie) => InkWell(
                            onTap: () => viewModel.navigator!.goToMovie(movie),
                            child: PopularLayout(movie, viewModel)))
                            .toList(),
                        options: CarouselOptions(
                            viewportFraction: 1,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            enableInfiniteScroll: false,
                            height: MediaQuery.of(context).size.width)),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(40, 42, 40, 1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(child: Text("New Release")),
                          Expanded(
                            child: homemodel.popularmovies.isEmpty
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                                : CarouselSlider(
                                    items: homemodel.popularmovies
                                        .map((movie) =>
                                            InkWell(
                                                onTap: () => viewModel.navigator!.goToMovie(movie),
                                                child: NewReleaseLayout(movie, viewModel)))
                                        .toList(),
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
                                  ),
                          )
                        ],
                      ))),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(40, 42, 40, 1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Recomended"),
                          Expanded(
                            child: homemodel.topmovies.isEmpty
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                                : CarouselSlider(
                                    items: homemodel.topmovies
                                        .map(
                                            (movie) => InkWell(
                                                onTap: () => viewModel.navigator!.goToMovie(movie),
                                                child: TopRatedLayout(movie, viewModel)))
                                        .toList(),
                                    options: CarouselOptions(
                                      padEnds: false,
                                      enableInfiniteScroll: false,
                                      disableCenter: true,
                                      viewportFraction: .4,
                                      height: MediaQuery.of(context).size.width,
                                      enlargeStrategy:
                                          CenterPageEnlargeStrategy.height,
                                      enlargeCenterPage: false,
                                    )),
                          ),
                        ],
                      ))),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  HomeViewModel initViewModel() {
    // TODO: implement initViewModel
    return HomeViewModel();
  }

  @override
  goToMovie(movie) {
    Navigator.pushNamed(context, MovieLayout.routeName, arguments: movie);
  }
}
