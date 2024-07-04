import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SliderProvider with ChangeNotifier {

  static late int  _studyDurationSliderValue;
  static late int _shortBreakDurationSliderValue;
  static late int _longBreakDurationSliderValue;
  static late int _roundSliderValue;

  static int get studyDurationSliderValue => _studyDurationSliderValue;
  static int get shortBreakDurationSliderValue =>
      _shortBreakDurationSliderValue;
  static int get longBreakDurationSliderValue => _longBreakDurationSliderValue;
  static int get roundSliderValue => _roundSliderValue;

  SliderProvider()  {
    loadSliderFromSharedPref();
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

  Future<void> loadSliderFromSharedPref() async{
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