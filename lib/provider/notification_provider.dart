import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationProvider with ChangeNotifier {
  late SharedPreferences _prefs;

  static late bool _isActive;

  static get isActive => _isActive;

  NotificationProvider() {
    loadNotifFromSharedPref();
  }

  void switchMode() {
    _isActive = !_isActive;
    saveNotifToSharedPref(_isActive);
    notifyListeners();
  }


  void saveNotifToSharedPref(bool value) {
    _prefs.setBool('isActive', value);
  }

  Future<void> loadNotifFromSharedPref() async {
    _prefs = await SharedPreferences.getInstance();
    _isActive = _prefs.getBool('isActive') ?? true;
    notifyListeners();
  }
}