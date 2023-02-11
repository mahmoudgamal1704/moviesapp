

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/items/constants.dart';

class MainProvider extends ChangeNotifier {

  int mainIndex=0;

  void changeIndex (ind) {
    mainIndex = ind;
    notifyListeners();
  }

  Future<void> initSharedPreferences () async {
    prefs = await  SharedPreferences.getInstance();
    ids = prefs?.getStringList('favmovies') ?? [];
  }

  void getWatchListIds(){
    ids = prefs?.getStringList('favmovies') ?? [];
  }
}