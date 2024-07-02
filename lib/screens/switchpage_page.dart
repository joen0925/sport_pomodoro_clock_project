import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_android_project/screens/pomodoro_page.dart';
import 'package:first_android_project/screens/sportsdoro_page.dart';
import 'package:first_android_project/provider/screen_provider.dart';



class SwitchpagePage extends StatelessWidget{
  const SwitchpagePage({super.key});

  @override
  Widget build(BuildContext context) {
    int screenIndex = context.watch<ScreenProvider>().screenIndex;

    return Center(
      child: choose(screenIndex),
    );
  }

  Widget choose(index){
    switch (index){
      case 0:
        return PomodoroPage();
      case 1:
        return SportsdoroPage();
      default:
        return Text("找不到頁面");
    }

  }
}