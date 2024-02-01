import 'package:flutter/material.dart';

class SystemProvider extends ChangeNotifier {
ThemeData _themeData;

  SystemProvider(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }  
}