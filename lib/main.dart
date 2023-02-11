import 'package:flutter/material.dart';
import 'package:movieapp/layouts/mainlayout.dart';
import 'package:movieapp/layouts/movielayout.dart';
import 'package:movieapp/providers/mainprovider.dart';
import 'package:movieapp/screens/filteredmovies/filteredmovied_screen.dart';
import 'package:movieapp/shared/items/constants.dart';
import 'package:provider/provider.dart';

import 'mytheme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MainProvider()..initSharedPreferences(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.darkTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: MainLayout.routeName,
      routes: {
        MainLayout.routeName: (context) => MainLayout(),
        MovieLayout.routeName: (context) => MovieLayout(),
        FilteredMoviesScreen.routeName: (context) => FilteredMoviesScreen(),
      },
    );
  }
}
