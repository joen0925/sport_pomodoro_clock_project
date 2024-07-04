import 'package:flutter/material.dart';
import 'package:first_android_project/screens/setting_page.dart';
import 'package:first_android_project/widgets/pomodoro_widget.dart';

class PomodoroPage extends StatelessWidget{
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Stack(
                fit: StackFit.expand,
                children: [
                  TimeIndicatorWidget(),
                  StudyBreakWidget(),
                ],
              ),
            ),
            const MediaButtons(),
            const RoundsWidget(),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}