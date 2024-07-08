import 'package:flutter/material.dart';
import 'package:first_android_project/widgets/sportsetting_widget.dart';

class SportsSettingsPage extends StatelessWidget {
  const SportsSettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFEEE4),
      ),
      backgroundColor: Color(0xFFFFEEE4),
      body: const Padding(
        padding: EdgeInsets.all(15.0),

        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimeandRoundWidget(),
                  NotificationSoundWidget(),
                  SettingsNotificationSwitch(),
                  AutoStartSwitch(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}