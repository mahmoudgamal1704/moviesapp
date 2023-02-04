import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/layouts/categlayout.dart';
import 'package:movieapp/screens/movies/movies_nav.dart';
import 'package:movieapp/screens/movies/movies_viewmodel.dart';

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
    double screenWidth = MediaQuery.of(context).size.width/3;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Browse Categories :'),
          SizedBox(height: 20,),
          Expanded(
              child: FutureBuilder(
            future: viewModel.getCategMoviesList(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator(color: Colors.white,);
              }else {
                return Container(
                  child: GridView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.genres?.length,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: screenWidth / 180.0,
                      // mainAxisExtent: 30,
                      // crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return CategLayout(snapshot.data!.genres![index]);
                    },
                  ),
                );
              }

            },
          ))
        ],
      ),
    );
  }

  @override
  MoviesViewModel initViewModel() {
    return MoviesViewModel();
  }
}
