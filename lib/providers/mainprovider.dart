

import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {

  int mainIndex=0;

  void changeIndex (ind) {
    mainIndex = ind;
    notifyListeners();
  }
}