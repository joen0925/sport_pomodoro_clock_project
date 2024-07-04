import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SliderProvider with ChangeNotifier {

  late int  _studyDurationSliderValue;
  late int _shortBreakDurationSliderValue;
  late int _longBreakDurationSliderValue;
  late int _roundSliderValue;

  int get studyDurationSliderValue => _studyDurationSliderValue;/*沒有初始化成功*/
  int get shortBreakDurationSliderValue =>
      _shortBreakDurationSliderValue;
  int get longBreakDurationSliderValue => _longBreakDurationSliderValue;
  int get roundSliderValue => _roundSliderValue;

  SliderProvider() {
    _loadSliderFromSharedPref();
  }

  void updateWorkDurationSliderValue(int newValue) {
    _studyDurationSliderValue = newValue;
    saveSliderToSharedPref(
        'studyDurationSliderValue', _studyDurationSliderValue);

    notifyListeners();
  }

  void updateShortBreakDurationSliderValue(int newValue) {
    _shortBreakDurationSliderValue = newValue;
    saveSliderToSharedPref(
        'shortBreakDurationSliderValue', _shortBreakDurationSliderValue);
    notifyListeners();
  }

  void updateLongBreakDurationSliderValue(int newValue) {
    _longBreakDurationSliderValue = newValue;
    saveSliderToSharedPref(
        "longBreakDurationSliderValue", _longBreakDurationSliderValue);
    notifyListeners();
  }

  void updateRoundSliderValue(int newValue) {
    _roundSliderValue = newValue;
    saveSliderToSharedPref("roundSliderValue", _roundSliderValue);
    notifyListeners();
  }


  Future<void> saveSliderToSharedPref(String key, int value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<void> _loadSliderFromSharedPref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _studyDurationSliderValue =
        prefs.getInt('studyDurationSliderValue') ?? 25;
    _shortBreakDurationSliderValue =
        prefs.getInt('shortBreakDurationSliderValue') ?? 5;
    _longBreakDurationSliderValue =
        prefs.getInt('longBreakDurationSliderValue') ?? 15;
    _roundSliderValue = prefs.getInt('roundSliderValue') ?? 4;
    notifyListeners();
  }
}