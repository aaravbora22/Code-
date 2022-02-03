import 'dart:async';

import 'package:flutter/material.dart';
import 'package:study_pomodoro/Pomodoro/timer.dart';

import 'package:percent_indicator/percent_indicator.dart';

class MinutePage extends StatefulWidget {
  const MinutePage({Key key}) : super(key: key);

  @override
  _MinutePageState createState() => _MinutePageState();
}

class _MinutePageState extends State<MinutePage> {
  double percent = 0;
  int timeLeftMinute = 5;

  void _startCountDown() {
    //Change seconds to minutes
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeftMinute > 0) {
        setState(() {
          timeLeftMinute--;
        });
      } else {
        timer.cancel();
      }
      if (timeLeftMinute == 0) {
        _showAlertDialogPomorodoMinute();
      }
      // if (timeLeft == 0) {
      // }
    });
  }

  void _showAlertDialogPomorodoMinute() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("You're Break Is Done!"),
          actions: [
            TextButton(
              child: Text("Return!"),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => TimerPage(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: CircularPercentIndicator(
                percent: percent,
                animation: true,
                animateFromLastPercent: true,
                radius: 250.0,
                lineWidth: 20.0,
                progressColor: Colors.white,
                center: Text(
                  // timeLeft == 0 ? 'DONE' : timeLeft.toString(),
                  timeLeftMinute.toString(),
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
            MaterialButton(
              onPressed: _startCountDown,
              child: Text(
                "S T A R T",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => TimerPage(),
            ),
          );
        },
      ),
    );
  }
}
