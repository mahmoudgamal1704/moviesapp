import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/screens/search/search_nav.dart';
import 'package:movieapp/screens/search/search_viewmodel.dart';

import '../../layouts/movielayout.dart';
import '../../layouts/searchlayout.dart';
import '../../models/basemodel.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends BaseView<SearchScreen, SearchViewModel>
    implements SearchNavigator {
  List<Results> movies = [];
  var textSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          TextField(
            onChanged: (value) {
              if (value.trim() == "") {
                setState(() {});
              }
            },
            onSubmitted: (value) {
              setState(() {});
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
          textSearchController.text.trim() == ''
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
              : FutureBuilder(
                  future: viewModel
                      .getSearchMoviesresults(textSearchController.text),
                  builder: (context, snapshot) {
                    print('${textSearchController.text}');
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(10),
                          itemCount: snapshot.data!.results!.length,
                          itemBuilder: (context, index) {
                            return Container(
                                height: 100,
                                child: InkWell(
                                    onTap: () => viewModel.navigator?.goToMovie(
                                        snapshot.data!.results![index]),
                                    child: SearchLayout(
                                        snapshot.data!.results![index])));
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(color: Colors.white, height: 10),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
        ],
      ),
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
