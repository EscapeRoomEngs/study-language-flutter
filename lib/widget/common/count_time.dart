import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CountTime extends StatefulWidget {
  const CountTime({super.key});

  @override
  State<CountTime> createState() => _CountTimeState();
}

class _CountTimeState extends State<CountTime> {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  String _elapsedTime = '00:00:00';

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        _elapsedTime = _formatTime(_stopwatch.elapsedMilliseconds);
      });
    });
  }

  void _stopTimer() {
    _stopwatch.stop();
    _timer?.cancel();
  }

  void _resetTimer() {
    _stopwatch.reset();
    setState(() {
      _elapsedTime = '00:00:00';
    });
  }

  String _formatTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _startTimer();
    return Row(
      children: [
        SvgPicture.asset("assets/image/ic_clock.svg"),
        const SizedBox(width: 4),
        Text(_elapsedTime)
      ],
    );
  }
}
