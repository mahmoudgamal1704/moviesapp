import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/models/CategResponse.dart';
import 'package:movieapp/screens/filteredmovies/filteredmovied_nav.dart';
import 'package:movieapp/screens/filteredmovies/filteredmovied_viewmodel.dart';

import '../../layouts/movielayout.dart';
import '../../layouts/searchlayout.dart';

class FilteredMoviesScreen extends StatefulWidget {
  // const FilteredMoviesScreen({Key? key}) : super(key: key);

static const String routeName="Filtered Movies";
  @override
  State<FilteredMoviesScreen> createState() => _FilteredMoviesScreenState();
}

class _FilteredMoviesScreenState extends BaseView<FilteredMoviesScreen,FilteredMoviesViewModel> implements FilteredMoviesNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }
  @override
  Widget build(BuildContext context) {
    var categ = ModalRoute.of(context)?.settings.arguments as Genres;

    return Scaffold(
      appBar: AppBar(
        title: Text('${categ.name}  Movies'),
        centerTitle: true,
      ),
      body: Container(
        child:  FutureBuilder(
          future: viewModel
              .getFilteredMoviesresults(categ.id.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (snapshot.hasData) {
              return ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data!.results!.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: 100,
                      child: InkWell(
                        onTap: () => viewModel.navigator?.goToMovie(
                            snapshot.data!.results![index]),
                          child: SearchLayout(snapshot.data!.results![index])));
                },
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(color: Colors.white, height: 10),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  @override
  FilteredMoviesViewModel initViewModel() {
    // TODO: implement initViewModel
   return FilteredMoviesViewModel();
  }

  @override
  goToMovie(movie) {
    // TODO: implement goToMovie
    Navigator.pushNamed(context, MovieLayout.routeName,arguments: movie);

  }
}
