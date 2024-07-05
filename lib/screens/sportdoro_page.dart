import 'package:flutter/material.dart';
import 'package:first_android_project/screens/sport_setting_page.dart';
import 'package:first_android_project/widgets/sportdoro_widget.dart';

class SportsdoroPage extends StatelessWidget{
  const SportsdoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const TimeIndicatorWidget(),
            const StudyBreakWidget(),
            const MediaButtons(),
            //const RoundsWidget(),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SportsSettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}