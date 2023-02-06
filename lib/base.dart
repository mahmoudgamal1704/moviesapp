import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/shared/items/constants.dart';

abstract class BaseNavigator {
  void showLoading({String message});

  void hideDialog();

  void showMessage(message);

  void addRemoveWatchList(int movieid);
}

class BaseViewModel<NAV extends BaseNavigator> extends ChangeNotifier {
  NAV? navigator = null;
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  VM initViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = initViewModel();
  }

  @override
  void hideDialog() {
    Navigator.pop(context);
  }

  @override
  void showLoading({String message = 'loading !!! '}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Row(
              children: [Text(message), CircularProgressIndicator()],
            ),
          ),
        );
      },
    );
  }

  @override
  void addRemoveWatchList(int movieid) {
    // TODO: implement addRemoveWatchList
    print('${checkWatchList(movieid)}   fref');
    print('${movieid}   ghghgh');
    if (checkWatchList(movieid) >= 0) {
      ids.remove(movieid);
      print('Removed');
    } else {
      ids.insert(ids.length,movieid);
      print('Added');
    }
    print(ids);
  }

  @override
  void showMessage(message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
        );
      },
    );
  }
}
