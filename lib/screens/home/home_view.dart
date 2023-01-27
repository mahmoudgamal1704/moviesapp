import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/layouts/popularlayout.dart';
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
  late InfiniteScrollController scrollcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollcontroller = InfiniteScrollController();
    viewModel.navigator = this;
  }

  @override
  void dispose() {
    super.dispose();
    scrollcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
      child: Column(
        children: [
          SizedBox(height: 50,),
          Expanded(
            child: FutureBuilder(
              future: viewModel.getpopularMoviesresults(),
              builder: (context, snapshot) {
                // CheckAPIdata(snapshot);
                if (snapshot.hasData){
                  return CarouselSlider(
                    items: snapshot.data!.results!.map((result) {
                      return PopularLayout(result);
                    }).toList(),
                    options:  CarouselOptions(),

                  );
                }else {
                  return Center(child: CircularProgressIndicator(),);
                }

              },
            ),
          ),
          SizedBox(height: 50,),
          Expanded(child: Text("GH")),
          SizedBox(height: 50,),
          Expanded(child: Text("GH")),
          SizedBox(height: 50,),
          Expanded(child: Text("GH")),
        ],
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
    // TODO: implement initViewModel
    return HomeViewModel();
  }
}
