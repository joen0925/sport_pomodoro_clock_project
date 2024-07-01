import 'package:flutter/material.dart';
import 'package:first_android_project/practice.dart';
import 'package:first_android_project/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:first_android_project/provider/screen_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ScreenProvider()),
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
      routes:{
        //"new_page": (context) => NewRoute(),
        //"info_page": (context) => InfoRoute(),
        "practise_page": (context) => PractiseRoute(),
      } ,
      home: HomePage(),
    );
  }
}


