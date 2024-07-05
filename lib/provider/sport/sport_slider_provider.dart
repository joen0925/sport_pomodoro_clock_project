import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SportSliderProvider with ChangeNotifier {

  static late int  _sportDurationSliderValue;
  static late int _breakDurationSliderValue;
  static late int _bufferDurationSliderValue;


  static int get sportDurationSliderValue => _sportDurationSliderValue;
  static int get breakDurationSliderValue =>
      _breakDurationSliderValue;
  static int get bufferDurationSliderValue => _bufferDurationSliderValue;


  SportSliderProvider()  {
    loadSliderFromSharedPref();
  }

  void updateSportDurationSliderValue(int newValue) {
    _sportDurationSliderValue = newValue;
    saveSliderToSharedPref(
        'sportDurationSliderValue', _sportDurationSliderValue);

    notifyListeners();
  }

  void updateBreakDurationSliderValue(int newValue) {
    _breakDurationSliderValue = newValue;
    saveSliderToSharedPref(
        'breakDurationSliderValue', _breakDurationSliderValue);
    notifyListeners();
  }

  void updateBufferDurationSliderValue(int newValue) {
    _bufferDurationSliderValue = newValue;
    saveSliderToSharedPref(
        "bufferDurationSliderValue", _bufferDurationSliderValue);
    notifyListeners();
  }

  Future<void> saveSliderToSharedPref(String key, int value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<void> loadSliderFromSharedPref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _sportDurationSliderValue =
        prefs.getInt('sportDurationSliderValue') ?? 1;
    _breakDurationSliderValue =
        prefs.getInt('breakDurationSliderValue') ?? 1;
    _bufferDurationSliderValue =
        prefs.getInt('bufferDurationSliderValue') ?? 5;
  }
}