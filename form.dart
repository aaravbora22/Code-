import 'package:flutter/material.dart';
import 'package:study_pomodoro/Pomodoro/homepage.dart';
import 'package:study_pomodoro/Pomodoro/pomorodo.dart';

class FormPageStage extends StatelessWidget {
  const FormPageStage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String _name;
  String _grade;
  String _schoolName;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Name:'),
        // ignore: missing_return
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name Is Required';
          }
        },
        onSaved: (String value) {
          _name = value;
        });
  }

  Widget _buildGrade() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Grade:'),
        // ignore: missing_return
        validator: (String value) {
          int calories = int.tryParse(value);
          if (calories == null || calories <= 0) {
            return 'Grade Must Be A Number';
          }
        },
        onSaved: (String value) {
          _grade = value;
        });
  }

  Widget _buildSchoolName() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'School Name:'),
        // ignore: missing_return
        validator: (String value) {
          if (value.isEmpty) {
            return 'School Name Is Required';
          }
        },
        onSaved: (String value) {
          _schoolName = value;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credentials:"),
      ),
      body: Container(
        margin: EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildName(),
              _buildGrade(),
              _buildSchoolName(),
              SizedBox(
                height: 100.0,
              ),
              ElevatedButton(
                  onPressed: () => {
                        if (!_formKey.currentState.validate())
                          {
                            // Navigator.of(context).pushReplacement(
                            //   MaterialPageRoute(
                            //     builder: (context) => HomePage(),
                            //   ),
                            // ),
                          },
                        _formKey.currentState.save(),
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //     builder: (context) => HomePage(),
                        //   ),
                        // ),
                      },
                  child: Text(
                    "Validate",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  )),
              SizedBox(height: 10.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => PomodoroHomePage(),
                      ),
                    );
                  },
                  child: Text(
                    "Begin!",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
