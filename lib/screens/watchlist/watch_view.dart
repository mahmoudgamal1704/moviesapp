import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/layouts/watchListlayout.dart';
import 'package:movieapp/screens/watchlist/watch_nav.dart';
import 'package:movieapp/screens/watchlist/watch_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../layouts/movielayout.dart';
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
    return ChangeNotifierProvider(
      create: (context) => WatchViewModel()..getmovieDetails(ids),
      builder: (context, child) {
        var favmodel = Provider.of<WatchViewModel>(context);
        favmodel.navigator=viewModel.navigator;
        return Scaffold(
          appBar: AppBar(
            title: Text('WatchList Movies'),
            centerTitle: true,
          ),
          body: Container(
              child: ids.isEmpty
                  ? const Center(
                      child: Text('no Movies'))
                  : favmodel.favMovies.isEmpty ? Center(child: CircularProgressIndicator(color: Colors.white,)):ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10),
                      itemCount: favmodel.favMovies.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                            height: 100,
                            child: InkWell(
                                // onTap: () => favmodel.navigator?.goToMovie(
                                //     favmodel.favMovies[index]),
                                child: Stack(
                              children: [
                                WatchListLayout(favmodel.favMovies[index]),
                                InkWell(
                                    onTap: () {
                                      favmodel.favmovies(favmodel
                                          .favMovies[index].id
                                          .toString());
                                    },
                                    child: WatchListMark(
                                        movieid: favmodel.favMovies[index].id
                                            .toString()))
                              ],
                            )));
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(color: Colors.white, height: 10),
                    )),
        );
      },
    );
  }

  @override
  WatchViewModel initViewModel() {
    return WatchViewModel();
  }

  @override
  goToMovie(movie) {
    // TODO: implement goToMovie
    Navigator.pushNamed(context, MovieLayout.routeName, arguments: movie);

  }
}
