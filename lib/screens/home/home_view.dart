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
            child: FutureBuilderAPI(viewModel.getNowPlayingMoviesresults, viewModel,CarouselOptions( viewportFraction: 1,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                enableInfiniteScroll: false,
                height: MediaQuery.of(context).size.width),"now"),
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
                      Text("New Release"),
                      Expanded(
                        child: FutureBuilderAPI(viewModel.getpopularMoviesresults, viewModel,CarouselOptions(
                          padEnds: false,
                          enableInfiniteScroll: false,
                          disableCenter: true,
                          viewportFraction: .4,
                          height: MediaQuery.of(context).size.width,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          enlargeCenterPage: false,
                        ),"new"),
                      ),
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
                        child: FutureBuilderAPI(viewModel.getTopRatedMoviesresults, viewModel,CarouselOptions(
                          padEnds: false,
                          enableInfiniteScroll: false,
                          disableCenter: true,
                          viewportFraction: .4,
                          height: MediaQuery.of(context).size.width,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          enlargeCenterPage: false,
                        ),"top"),
                      ),
                    ],
                  ))),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
    // TODO: implement initViewModel
    return HomeViewModel();
  }

  @override
  goToMovie(id) {
    Navigator.pushNamed(context, MovieLayout.routeName,arguments: id);
  }
}
