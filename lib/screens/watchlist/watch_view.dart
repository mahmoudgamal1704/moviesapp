import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/screens/watchlist/watch_nav.dart';
import 'package:movieapp/screens/watchlist/watch_viewmodel.dart';

class WatchScreen extends StatefulWidget {

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends BaseView<WatchScreen,WatchViewModel> implements WatchNavigator{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }

  @override
  WatchViewModel initViewModel() {
   return WatchViewModel();
  }
}
