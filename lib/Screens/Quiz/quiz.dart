import 'package:flutter/material.dart';
import 'package:health_care/Screens/Quiz/questions.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Ready to answer few Questions?',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 5,),

              Text(
                'It will only take a minute',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),

              SizedBox(height: 5,),

              Text(
                '(If Yes click on the below Start Button)',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black38
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.lightBlueAccent[700],
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Questions()));
                    },
                    child: Text('START')),
              ),
            ],
          )
        ),
      ),
    );
  }
}
