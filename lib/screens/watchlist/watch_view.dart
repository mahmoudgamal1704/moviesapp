import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/layouts/watchListlayout.dart';
import 'package:movieapp/screens/watchlist/watch_nav.dart';
import 'package:movieapp/screens/watchlist/watch_viewmodel.dart';
import '../../shared/items/constants.dart';

class WatchScreen extends StatefulWidget {
  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends BaseView<WatchScreen, WatchViewModel>
    implements WatchNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WatchList Movies'),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: viewModel.getmovieDetails(ids),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              print('Wait');
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (snapshot.hasData) {
              print('data');
              if(snapshot.data!.length > 0 ) {
                return ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        height: 100,
                        child: InkWell(
                          // onTap: () => viewModel.navigator?.goToMovie(
                          //     snapshot.data!.results![index]),
                            child: Stack(
                              children: [
                                WatchListLayout(snapshot.data![index]),
                                InkWell(
                                    onTap: () {
                                      viewModel.navigator!.addRemoveWatchList(
                                          snapshot.data![index].id!.toInt());
                                      setState(() {});
                                    },
                                    child: WatchListMark(
                                        movieid: snapshot.data![index].id!.toInt()))
                              ],
                            )));
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(color: Colors.white, height: 10),
                );
              }else {
                return Center(
                    child: Text(
                      'No Movies',
                      style: TextStyle(color: Colors.white),
                    ));
              }

            } else {
              print('error');
              return Center(
                  child: Text(
                'SomeThing Error Happen Please Try Again',
                style: TextStyle(color: Colors.white),
              ));
            }
          },
        ),
      ),
    );
  }

  @override
  WatchViewModel initViewModel() {
    return WatchViewModel();
  }
}
