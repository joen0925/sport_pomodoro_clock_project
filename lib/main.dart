import 'package:flutter/material.dart';
import 'package:first_android_project/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:first_android_project/provider/screen_provider.dart';
import 'package:first_android_project/provider/timer_provider.dart';
import 'package:first_android_project/provider/slider_provider.dart';
import 'package:first_android_project/provider/audio_provider.dart';
import 'package:first_android_project/provider/auto_start_provider.dart';
import 'package:first_android_project/provider/notification_provider.dart';
import 'package:first_android_project/provider/sport/sport_timer_provider.dart';
import 'package:first_android_project/provider/sport/sport_slider_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sliderProvider = SliderProvider();
  await sliderProvider.loadSliderFromSharedPref();
  final sportSliderProvider = SportSliderProvider();
  await sportSliderProvider.loadSliderFromSharedPref();
  final autoStartProvider = AutoStartProvider();
  final notificationProvider = NotificationProvider();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ScreenProvider()),
      ChangeNotifierProvider(create: (context) => TimerProvider()),
      ChangeNotifierProvider.value(value: sliderProvider),
      ChangeNotifierProvider.value(value: sportSliderProvider),
      ChangeNotifierProvider(create: (context) => SportTimerProvider()),
      ChangeNotifierProvider.value(value: notificationProvider),
      ChangeNotifierProvider(create: (context) => SoundSelectionProvider()),
      ChangeNotifierProvider.value(value: autoStartProvider)
    ],
    child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


