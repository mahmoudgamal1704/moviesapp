import 'package:flutter/material.dart';
import 'package:movieapp/base.dart';
import 'package:movieapp/screens/home/home_nav.dart';
import 'package:movieapp/screens/home/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }

  @override
  HomeViewModel initViewModel() {
    // TODO: implement initViewModel
    return HomeViewModel();
  }
}
