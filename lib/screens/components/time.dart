import 'dart:async';

import 'package:flutter/material.dart';

import '../../size_config.dart';

class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${_timeOfDay.hourOfPeriod}:${_timeOfDay.minute}",
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(width: 10),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            _period,
            style: TextStyle(fontSize: getProportionateScreenWidth(18)),
          ),
        )
      ],
    );
  }
}
