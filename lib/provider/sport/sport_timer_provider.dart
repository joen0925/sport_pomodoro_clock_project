import 'package:flutter/material.dart';
import 'package:first_android_project/provider/auto_start_provider.dart';
import 'package:first_android_project/provider/notification_provider.dart';
import 'package:first_android_project/provider/sport/sport_slider_provider.dart';
import 'package:first_android_project/provider/audio_provider.dart';
import 'dart:async';


class SportTimerProvider with ChangeNotifier {
  final SoundSelectionProvider _audioProvider = SoundSelectionProvider();

  late Timer _timer;
  int _currentRound = 0;

  late int _currentTimeInSeconds;

  bool _isRunning = false;
  bool _isBreakTime = false;
  bool _isBuffer = false;


  SportTimerProvider() {
    resetTimer();
  }

  bool get isRunning => _isRunning;

  bool get isBreakTime => _isBreakTime;

  bool get isBuffer => _isBuffer;

  int get currentTimeInSeconds => _currentTimeInSeconds;

  int get maxTimeInSeconds => (_isBreakTime ?
          (_isBuffer ? SportSliderProvider.bufferDurationSliderValue
              : SportSliderProvider.breakDurationSliderValue * 60)
              : SportSliderProvider.sportDurationSliderValue * 60) ;

  bool get isEqual => currentTimeInSeconds == maxTimeInSeconds;

  String get currentTimeDisplay {
    int minutes = _currentTimeInSeconds ~/ 60;
    int seconds = _currentTimeInSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  String get currentRoundDisplay{
    return '已完成 $_currentRound 次';
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

  void jumpNextRound() {//待修改
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
    if (_isBuffer) {//判斷緩衝時間是否結束
      _currentTimeInSeconds = SportSliderProvider.sportDurationSliderValue * 60;
      _isBuffer = !_isBuffer;//重製
      _isBreakTime = !_isBreakTime;//重製
      _addRound();
    }else if(_isBreakTime){//判斷休息時間是否結束
          _currentTimeInSeconds =
              SportSliderProvider.bufferDurationSliderValue;
          _isBuffer = !_isBuffer;//緩重時間完成
    }else{//運動時間結束(進入休息時間)
      _currentTimeInSeconds =
          SportSliderProvider.breakDurationSliderValue * 60;
      _isBreakTime = !_isBreakTime;//休息時間完成
    }
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
    _currentRound++;
  }

  void resetTimer() {
    _currentTimeInSeconds = maxTimeInSeconds;
    notifyListeners();
  }

  void resetCurrentRound(){
    _currentRound = 0;
    notifyListeners();
  }
}