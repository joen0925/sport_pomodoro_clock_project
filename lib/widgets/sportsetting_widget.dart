import 'package:first_android_project/provider/sport/sport_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_android_project/provider/sport/sport_slider_provider.dart';
import 'package:first_android_project/provider/timer_provider.dart';
import 'package:first_android_project/provider/audio_provider.dart';
import 'package:first_android_project/provider/auto_start_provider.dart';
import 'package:first_android_project/provider/notification_provider.dart';




class TimeandRoundWidget extends StatelessWidget {
  const TimeandRoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sportSliderProvider = Provider.of<SportSliderProvider>(context);
    return Column(
      children: [
        DurationWidget(
          title: '運動時間',
          sliderValue: SportSliderProvider.sportDurationSliderValue,
          max: 60,
          min: 1,
          updateValue: (newValue) {
            sportSliderProvider.updateSportDurationSliderValue(newValue);
          },
          minText: '秒',
        ),
        DurationWidget(
          title: '休息時間',
          sliderValue: SportSliderProvider.breakDurationSliderValue,
          max: 60,
          min: 1,
          updateValue: (newValue) {
            sportSliderProvider.updateBreakDurationSliderValue(newValue);
          },
          minText: '分',
        ),
        DurationWidget(
          title: '預備時間',
          sliderValue: SportSliderProvider.bufferDurationSliderValue,
          max: 30,
          min: 1,
          updateValue: (newValue) {
            sportSliderProvider.updateBufferDurationSliderValue(newValue);
          },
          minText: '秒',
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class DurationWidget extends StatelessWidget {
  DurationWidget({
    super.key,
    required this.title,
    required this.sliderValue,
    required this.max,
    required this.min,
    required this.updateValue,
    required this.minText,
  });
  final String title;
  final double max;
  final double min;
  int sliderValue;
  String minText;
  void Function(int newValue) updateValue;

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<SportTimerProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: Stack(
            children: [
              TextWithPadding(text: title),
              Slider(
                label: "$sliderValue",
                max: max,
                min: min,
                value: sliderValue.toDouble(),
                onChanged: (value) {
                  sliderValue = value.toInt();
                  updateValue(sliderValue);
                  timerProvider.resetTimer();
                },
              ),
              Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text('${min.toInt()} $minText')),
              Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Text('${max.toInt()} $minText')),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class TextWithPadding extends StatelessWidget {
  const TextWithPadding({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class NotificationSoundWidget extends StatelessWidget {
  const NotificationSoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SoundSelectionProvider>(
        builder: (context, provider, child) {
          return DropdownButtonFormField<String>(
            value: provider.selectedAudioFile,
            decoration: const InputDecoration(
              labelText: '提醒音效',
            ),
            items: provider.audioFiles.map((audioFile) {
              return DropdownMenuItem<String>(
                value: audioFile,
                child: Text(
                  audioFile,
                ),
              );
            }).toList(),
            onChanged: (value) {
              provider.setSelectedAudioFile(value!);
            },
          );
        });
  }
}

class AutoStartSwitch extends StatelessWidget {
  const AutoStartSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final autoStartProvider = Provider.of<AutoStartProvider>(context);
    return SwitchListTile(
      title: const Text('自動開始'),
      value: AutoStartProvider.autoStart,
      onChanged: (value) {
        value = !value;
        autoStartProvider.switchMode();
      },
    );
  }
}

class SettingsNotificationSwitch extends StatelessWidget {
  const SettingsNotificationSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context);
    return SwitchListTile(
      title: const Text('提醒音效'),
      value: NotificationProvider.isActive,
      onChanged: (value) {
        value = !value;
        notificationProvider.switchMode();
      },
    );
  }
}