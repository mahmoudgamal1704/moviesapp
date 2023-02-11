import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/screens/search/search_nav.dart';
import 'package:movieapp/screens/search/search_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../layouts/movielayout.dart';
import '../../layouts/searchlayout.dart';
import '../../models/basemodel.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends BaseView<SearchScreen, SearchViewModel>
    implements SearchNavigator {
  // List<Results> movies = [];
  var textSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(),
      builder: (context, child) {
        var srchprov=Provider.of<SearchViewModel>(context);
        return Container(
          // color: Colors.red,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: (value) {
                  srchprov.getSearchMoviesresults(value);
                },
                onSubmitted: (value) {
                  srchprov.getSearchMoviesresults(value);

                },
                controller: textSearchController,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 5, color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 5, color: Colors.white)),
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.white,
                ),
              ),
              srchprov.movies.isEmpty
                  ? Expanded(
                child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 200),
                      child: Column(
                        children: [
                          Image.asset('assets/images/nomovieicon.png'),
                          Text("No Movies"),
                        ],
                      ),
                    )),
              )
                  : Expanded(
                    child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                itemCount: srchprov.movies.length,
                itemBuilder: (context, index) {
                    return Container(
                        height: 100,
                        child: InkWell(
                            onTap: () => viewModel.navigator?.goToMovie(
                                srchprov.movies[index]),
                            child: SearchLayout(
                                srchprov.movies[index])));
                },
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(color: Colors.white, height: 10),
              ),
                  ),
            ],
          ),
        );
      },

    );
  }

  @override
  SearchViewModel initViewModel() {
    return SearchViewModel();
  }

  @override
  goToMovie(movie) {
    // TODO: implement goToMovie
    Navigator.pushNamed(context, MovieLayout.routeName, arguments: movie);
  }
}
