import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

class MyTime extends StatefulWidget {
  @override
  _MyTimeState createState() => _MyTimeState();
}

class _MyTimeState extends State<MyTime> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TimerBuilder.periodic(
              const Duration(seconds: 1),
              builder: (context) {
                return Text(
                  formatDate(DateTime.now(), [hh, ':', nn, ':', ss, ' ', am]),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }
            )
          ]
        ),
      );
  }
}