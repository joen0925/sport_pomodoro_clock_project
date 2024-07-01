import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_android_project/provider/timer_provider.dart';

class TimeIndicatorWidget extends StatelessWidget {
  const TimeIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double time = context.watch<TimerProvider>().start;
    context.read<TimerProvider>().startTimer();
    return CircularProgressIndicator(
      strokeWidth: 20.0,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
      backgroundColor: Colors.redAccent,
      value: time,
    );
  }
}

class StudyBreakWidget extends StatelessWidget {
  const StudyBreakWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //TimeWidget(),
        SizedBox(height: 10.0),
        //TimeModeWidget(),
      ],
    );
  }
}

class TimeWiget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class TimeModeWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}