import 'package:flutter/material.dart';
import 'package:movieapp/providers/mainprovider.dart';
import 'package:movieapp/screens/home/home_view.dart';
import 'package:movieapp/screens/movies/movies_view.dart';
import 'package:movieapp/screens/search/search_view.dart';
import 'package:movieapp/screens/watchlist/watch_view.dart';
import 'package:provider/provider.dart';

import '../screens/home/home_viewmodel.dart';

class MainLayout extends StatefulWidget {
  static const String routeName = "MainLayout";

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {

  @override
  Widget build(BuildContext context) {
    var myprov = Provider.of<MainProvider>(context);
    return  Scaffold(
          // backgroundColor: Constants.mainBGColor,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: myprov.mainIndex,
            onTap: (value) {
              myprov.changeIndex(value);
              // currentIndex = value;
              // setState(() {});
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  label: "Home",
                  icon: ImageIcon(AssetImage('assets/images/homeicon.png'),
                      size: 30)),
              BottomNavigationBarItem(
                  label: "Search",
                  icon: ImageIcon(AssetImage('assets/images/searchicon.png'),
                      size: 30)),
              BottomNavigationBarItem(
                  label: "Movies",
                  icon: ImageIcon(AssetImage('assets/images/movieicon.png'),
                      size: 30)),
              BottomNavigationBarItem(
                  label: "WatchList",
                  icon: ImageIcon(AssetImage('assets/images/bookmarkicon.png'),
                      size: 30)),
            ],
          ),
          body : tabs[myprov.mainIndex],

        );
  }

  List<Widget> tabs = [
      HomeScreen(),
    SearchScreen(),
    MoviesScreen(),
    WatchScreen()

  ];
}
