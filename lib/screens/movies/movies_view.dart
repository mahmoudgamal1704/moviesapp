import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/layouts/categlayout.dart';
import 'package:movieapp/models/CategResponse.dart';
import 'package:movieapp/screens/movies/movies_nav.dart';
import 'package:movieapp/screens/movies/movies_viewmodel.dart';
import 'package:provider/provider.dart';

import '../filteredmovies/filteredmovied_screen.dart';

class MoviesScreen extends StatefulWidget {
  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends BaseView<MoviesScreen, MoviesViewModel>
    implements MoviesNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 2;
    double screenhight = (MediaQuery.of(context).size.height - 24) / 2;
    return ChangeNotifierProvider(
      create: (context) => MoviesViewModel()..getCategMoviesList(),
      builder: (context, child) {
        var categmodel = Provider.of<MoviesViewModel>(context);
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Browse Categories :'),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: categmodel.categs.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : Container(
                          child: GridView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: categmodel.categs.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: screenWidth / screenhight,
                              // mainAxisExtent: 30,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () => viewModel.navigator!
                                      .goToFilteredMovies(
                                          categmodel.categs[index]),
                                  child: CategLayout(categmodel.categs[index]));
                            },
                          ),
                        ))
            ],
          ),
        );
      },
    );
  }

  @override
  MoviesViewModel initViewModel() {
    return MoviesViewModel();
  }

  @override
  goToFilteredMovies(categ) {
    // TODO: implement goToFilteredMovies
    Navigator.pushNamed(context, FilteredMoviesScreen.routeName,
        arguments: categ);
    ;
  }
}
