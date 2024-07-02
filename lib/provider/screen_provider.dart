import 'package:flutter/material.dart';


class ScreenProvider with ChangeNotifier{
  int _screenIndex = 0;
  String _screenTitleName = '番茄時鐘';

  int get screenIndex => _screenIndex;
  String get screenTitleName => _screenTitleName;

  void setScreenIndex(int index){
    _screenIndex = index;
    notifyListeners();
  }

  void setScreenTitleNamae(String title){
    _screenTitleName = title;
    notifyListeners();
  }
}