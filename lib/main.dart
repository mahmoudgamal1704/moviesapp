import 'package:flutter/material.dart';
import 'package:movieapp/layouts/mainlayout.dart';
import 'package:movieapp/layouts/movielayout.dart';

import 'mytheme.dart';

void main() {
  runApp(MyApp());
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
      },
    );
  }
}
