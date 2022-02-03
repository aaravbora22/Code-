import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_pomodoro/Pomodoro/homepage.dart';

class PomodoroHomePage extends StatefulWidget {
  const PomodoroHomePage({Key key}) : super(key: key);

  @override
  _PomodoroHomePageState createState() => _PomodoroHomePageState();
}

class _PomodoroHomePageState extends State<PomodoroHomePage> {
  List<String> images = [
    "https://image.shutterstock.com/image-vector/calculator-logo-creative-mathematics-app-600w-746063503.jpg", //Math
    "https://image.shutterstock.com/image-vector/nano-lab-logo-template-vector-600w-311421389.jpg", //Chemistry
    "https://image.shutterstock.com/image-vector/dna-genetic-symbol-man-icon-600w-340539311.jpg", //Biology
    "https://image.shutterstock.com/z/stock-vector-sketch-of-physics-lab-with-working-little-people-doodle-cute-miniature-of-teamwork-and-science-1810404688.jpg", //Physics
    "https://image.shutterstock.com/image-vector/tone-icon-vector-trendy-flat-600w-1917379502.jpg", //Music
    "https://image.shutterstock.com/image-vector/zen-enso-symbol-hand-drawn-600w-1888979521.jpg", //Design
    "https://image.shutterstock.com/image-vector/world-government-logo-national-symbol-600w-1751505713.jpg", //Geography
    "https://image.shutterstock.com/image-photo/image-set-color-pencils-600w-1569217348.jpg", //Visual Art
    "https://image.shutterstock.com/image-vector/aphrodite-logo-600w-529148593.jpg", //History
  ];

  Widget customcard(String langname, String image) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Material(
            color: Colors.blue,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(100.0),
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        child: ClipOval(
                          child: Image(
                            image: NetworkImage(image),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      langname,
                      style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(20.0),
                  //   child: Text(
                  //     "Addition is very important part in life since it is a basic concept in mathematics and learning addition is very fun and interesting!",
                  //     style: TextStyle(
                  //       fontSize: 18.0,
                  //       color: Colors.white,
                  //     ),
                  //     maxLines: 5,
                  //     textAlign: TextAlign.justify,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, Aarav Bora!"),
      ),
      body: ListView(
        children: <Widget>[
          customcard(
            "Math",
            images[0],
          ),
          customcard(
            "Chemistry",
            images[1],
          ),
          customcard(
            "Biology",
            images[2],
          ),
          customcard(
            "Physics",
            images[3],
          ),
          customcard(
            "Music",
            images[4],
          ),
          customcard(
            "Design",
            images[5],
          ),
          customcard(
            "Geography",
            images[6],
          ),
          customcard(
            "Visual Art",
            images[7],
          ),
          customcard(
            "History",
            images[8],
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (context) => HomePage(),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
