import 'package:flutter/material.dart';
import 'package:first_android_project/provider/auto_start_provider.dart';
import 'package:first_android_project/provider/notification_provider.dart';
import 'package:first_android_project/provider/slider_provider.dart';
import 'package:first_android_project/provider/audio_provider.dart';
import 'dart:async';


class TimerProvider with ChangeNotifier {
  final SoundSelectionProvider _audioProvider = SoundSelectionProvider();

  late Timer _timer;
  int _currentRound = 1;

  late int _currentTimeInSeconds;

  bool _isRunning = false;
  bool _isBreakTime = false;


  TimerProvider() {
    resetTimer();
  }

  bool get isRunning => _isRunning;

  bool get isBreakTime => _isBreakTime;

  int get currentTimeInSeconds => _currentTimeInSeconds;

  int get maxTimeInSeconds =>
      (_isBreakTime ? (_currentRound == SliderProvider.roundSliderValue
          ? SliderProvider.longBreakDurationSliderValue
          : SliderProvider.shortBreakDurationSliderValue)
          : SliderProvider.studyDurationSliderValue) *
          60;

  bool get isEqual => currentTimeInSeconds == maxTimeInSeconds;

  String get currentTimeDisplay {
    int minutes = _currentTimeInSeconds ~/ 60;
    int seconds = _currentTimeInSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  String get currentRoundDisplay {
    return '回合 $_currentRound 之 ${SliderProvider.roundSliderValue}';
  }

  String get sportCurrentRoundDisplay{
    return '已完成 ${_currentRound - 1} ';
  }

  void toggleTimer() {

    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
      notifyListeners();
    } else {
      _timer.cancel();
      _isRunning = false;
      notifyListeners();
    }
  }

  void jumpNextRound() {
    if (_isRunning) {
      _timer.cancel();
      _isRunning = false;
      notifyListeners();
    }

    _timeControl();

    if (AutoStartProvider.autoStart == false) {
      _timer.cancel();
      _isRunning = false;
      notifyListeners();
    }
  }

  void _timeControl() {
    if (_isBreakTime) {//判斷休息時間是否結束
      _currentTimeInSeconds = SliderProvider.studyDurationSliderValue * 60;
      _addRound();
    } else {
      if (_currentRound == SliderProvider.roundSliderValue) {
        _currentTimeInSeconds =
            SliderProvider.longBreakDurationSliderValue * 60;
      } else {
        _currentTimeInSeconds =
            SliderProvider.shortBreakDurationSliderValue * 60;
      }
    }

    _isBreakTime = !_isBreakTime;
    toggleTimer();
  }

  void _updateTimer(Timer timer) {
    if (_currentTimeInSeconds > 0) {
      _currentTimeInSeconds--;
      notifyListeners();
    } else {
      _timer.cancel();
      _isRunning = false;

      _timeControl();

      if (AutoStartProvider.autoStart == false) {
        _timer.cancel();
        _isRunning = false;
        notifyListeners();
      }

      if (NotificationProvider.isActive) {
        _audioProvider.playSelectedAudio();
      }
    }
  }

  void _addRound() {
    _currentRound < SliderProvider.roundSliderValue
        ? _currentRound++
        : _currentRound = 1;
  }


  void resetTimer() {
    _currentTimeInSeconds = maxTimeInSeconds;
    notifyListeners();
  }
}