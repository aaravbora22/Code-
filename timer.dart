import 'dart:async';

import 'package:flutter/material.dart';
import 'package:study_pomodoro/Pomodoro/homepage.dart';
import 'package:study_pomodoro/Pomodoro/pomorodo.dart';
import 'package:study_pomodoro/Pomodoro/statistics.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '5minute.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int timeLeft = 25;
  double percent = 0;

  // Time Method
  void _startCountDown() {
    //Change seconds to minutes
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
      }
      if (timeLeft == 0) {
        _showAlertDialogPomorodo();
      }
      // if (timeLeft == 0) {
      // }
    });
  }

  void _showAlertDialogPomorodo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Take Break?"),
          actions: [
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MinutePage(),
                  ),
                );
              },
            ),
            TextButton(
              child: Text("No"),
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
      appBar: AppBar(
        title: Text("Welcome To Pomorodo:"),
      ),
      backgroundColor: Colors.lightBlue[100],
      drawer: Drawer(
        child: Container(
            color: Colors.lightBlue,
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Text(
                      'W H E R E  T O  G O ?',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.timelapse),
                  title: Text(
                    'Home',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => TimerPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.check_box),
                  title: Text(
                    'Classes',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => StatisticsHomePageTasks()),
                    );
                  },
                ),
              ],
            )),
      ),
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
                  timeLeft.toString(),
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
            MaterialButton(
              onPressed: _startCountDown,
              child: Text(
                "B E G I N",
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
              builder: (context) => HomePage(),
            ),
          );
        },
      ),
    );
  }
}
