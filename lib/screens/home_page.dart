import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_android_project/provider/screen_provider.dart';
import 'package:first_android_project/screens/switchpage_page.dart';


class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("番茄運動時鐘"),
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
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('番茄運動時鐘'), //menu設計
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text("番茄時鐘"),
              onTap: () {
                context.read<ScreenProvider>().setScreenIndex(0);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
                leading: Icon(Icons.directions_run),
                title: Text("運動循環時鐘"),
                onTap: () {
                  context.read<ScreenProvider>().setScreenIndex(1);
                  Navigator.of(context).pop();
                }
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title:Text("錯誤測試"),
              onTap: (){
                context.read<ScreenProvider>().setScreenIndex(2);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
      body:SwitchpagePage(),
    );
  }
}


