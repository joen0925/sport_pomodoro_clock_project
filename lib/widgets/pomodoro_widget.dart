import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_android_project/provider/timer_provider.dart';

class TimeIndicatorWidget extends StatelessWidget {
  const TimeIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    double time = 1 -
        timerProvider.currentTimeInSeconds / (timerProvider.maxTimeInSeconds);

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
        TimeWidget(),
        SizedBox(height: 10.0),
        TimeModeWidget(),
      ],
    );
  }
}

class TimeWidget extends StatelessWidget{
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    return Text(
      timerProvider.currentTimeDisplay,
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}

class TimeModeWidget extends StatelessWidget{
  const TimeModeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Text(
      timerProvider.isBreakTime ? '休息' : '專注',
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}

class MediaButtons extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class RoundsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}