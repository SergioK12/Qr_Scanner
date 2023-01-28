import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int selectedMenuOption = 0;

  int get getMenuOpt {
    return selectedMenuOption;
  }

  set selectedMenuOpt(int i) {
    selectedMenuOption = i;
    notifyListeners();
  }
}
