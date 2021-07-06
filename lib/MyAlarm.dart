import 'dart:async';
import 'package:flutter/material.dart';

class MyAlarm extends StatefulWidget {
  @override
  _MyAlarmState createState() => _MyAlarmState();
}

class _MyAlarmState extends State<MyAlarm> {
  late Timer _timer;
  bool _isRunning = false;
  int _timerCount = 0;
  String _buttonText = 'Start';
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Application'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.orange,
              child: TextButton(
                child: Container(
                  child: Text(
                    '$_buttonText',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  _isRunning = !_isRunning;
                  if (_isRunning) {
                    setState(() {
                      _timerCount = 0;
                      _buttonText = 'Stop';
                    });
                    _timer =
                        Timer.periodic(Duration(milliseconds: 100), (timer) {
                      setState(() {
                        _timerCount++;
                      });
                    });
                  } else {
                    _timer.cancel();
                    setState(() {
                      _buttonText = 'Start';
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text("$_timerCount"),
            ),
          ],
        ),
      ),
    );
  }
}
