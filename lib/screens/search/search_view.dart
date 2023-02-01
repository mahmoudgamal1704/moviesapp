import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/screens/search/search_nav.dart';
import 'package:movieapp/screens/search/search_viewmodel.dart';

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
              if(value.trim() ==""){
                setState(() {

                });
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
          FutureBuilder(
            future: viewModel.getSearchMoviesresults(textSearchController.text),
            builder: (context, snapshot) {
              print('${textSearchController.text}');
              if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: Colors.white ,),);
              } else if (snapshot.hasData) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ListView.builder(
                      itemExtent: 30,
                      itemCount: snapshot.data!.results!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            color: Colors.red,
                            child:
                                Text('${snapshot.data!.results![index].title}'));
                      },
                    ),
                  ),
                );
              } else {
                print('nnnnn');
                print('${snapshot.error}');
                return Center(child: Text("No Movies"));
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
}
