import 'package:flutter/material.dart';
import 'package:study_pomodoro/Files/file.dart';
import 'package:study_pomodoro/Pomodoro/onboarding.dart';
import 'package:study_pomodoro/Pomodoro/timer.dart';
import 'package:percent_indicator/percent_indicator.dart';

double percent = 0;

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose:"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularPercentIndicator(
              percent: percent,
              animation: true,
              animateFromLastPercent: true,
              radius: 250.0,
              lineWidth: 20.0,
              progressColor: Colors.red,
              center: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Pomodoro"),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => TimerPage(),
                  ));
                },
              ),
            ),
            const SizedBox(height: 50.0),
            CircularPercentIndicator(
              percent: percent,
              animation: true,
              animateFromLastPercent: true,
              radius: 250.0,
              lineWidth: 20.0,
              progressColor: Colors.blue,
              center: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Notes"),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => FileHomePage(),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => OnBoardingPage()));
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
