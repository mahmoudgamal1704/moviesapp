import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/screens/search/search_nav.dart';
import 'package:movieapp/screens/search/search_viewmodel.dart';

class SearchScreen extends StatefulWidget {

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends BaseView<SearchScreen,SearchViewModel> implements SearchNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.navigator=this;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red
    );
  }

  @override
  SearchViewModel initViewModel() {
    return SearchViewModel();
  }
}
