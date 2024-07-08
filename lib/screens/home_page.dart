import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_android_project/provider/screen_provider.dart';
import 'package:first_android_project/screens/switchpage_page.dart';


class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<ScreenProvider>().screenTitleName),
        centerTitle: true,
        leading: Builder(
          builder: (context){
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Color(0xFFF17F42),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/runtomato_icon.png'),
                  fit: BoxFit.none
                ),
              ),
              child: Text('番茄運動時鐘'), //menu設計
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text("番茄時鐘"),
              onTap: () {
                context.read<ScreenProvider>().setScreenIndex(0);
                context.read<ScreenProvider>().setScreenTitleNamae("番茄時鐘");
                Navigator.of(context).pop();
              },
            ),
            ListTile(
                leading: Icon(Icons.directions_run),
                title: Text("運動循環時鐘",),
                onTap: () {
                  context.read<ScreenProvider>().setScreenIndex(1);
                  context.read<ScreenProvider>().setScreenTitleNamae("運動時鐘");
                  Navigator.of(context).pop();
                }
            ),
          ],
        ),
      ),
      body:SwitchpagePage(),
      backgroundColor: Color(0xFFFFEEE4),
    );
  }
}


