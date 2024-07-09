import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:first_android_project/provider/sport/sport_slider_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  final sportSliderProvider = SportSliderProvider();
  await sportSliderProvider.loadSliderFromSharedPref();
  
  setUp (() {

  });

  test('測試運動時鐘初始化是否正確',(){
    expect(SportSliderProvider.sportDurationSliderValue, 30);
    expect(SportSliderProvider.breakDurationSliderValue, 30);
    expect(SportSliderProvider.bufferDurationSliderValue, 5);
  });
}
