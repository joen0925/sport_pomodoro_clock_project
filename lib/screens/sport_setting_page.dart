import 'package:flutter/material.dart';

class SportsSettingsPage extends StatelessWidget {
  const SportsSettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  //TimeandRoundWidget(),
                  //NotificationSoundWidget(),
                  //SettingsNotificationSwitch(),
                  //AutoStartSwitch(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}