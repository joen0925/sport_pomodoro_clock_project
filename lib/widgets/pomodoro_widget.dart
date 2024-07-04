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
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
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
  const MediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final timeProvider = Provider.of<TimerProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.replay, size: 30.0,),
          onPressed: timeProvider.isEqual ? null : timeProvider.resetTimer,
        ),
        IconButton(
          icon: Icon(
            timeProvider.isRunning ?  Icons.pause : Icons.play_arrow, size: 30.0,),
          onPressed: (){
            timeProvider.toggleTimer();
            },
        ),
        IconButton(
          icon: Icon(Icons.navigate_next, size: 30.0,),
          onPressed: (){
            timeProvider.jumpNextRound();
          },
        ),
      ],
    );
  }
}

class RoundsWidget extends StatelessWidget{
  const RoundsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Center(
      child: Text(timerProvider.currentRoundDisplay),
    );
  }
}