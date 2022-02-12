import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Screens/MainPage/home.dart';

class Questions extends StatefulWidget {

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  DatabaseReference _reference = FirebaseDatabase.instance.reference().child('Users');
  final user = FirebaseAuth.instance.currentUser;

  Map<dynamic, dynamic> values;

  void lastDate(){
    _reference.child(user.uid).child("Quiz").orderByChild(date).limitToLast(7).once().then((DataSnapshot snapshot) {
      values = snapshot.value;
      values.forEach((key,values) {
        print(values);
      });
    });
  }

  int numberOfRows;

  void numberofRows(){
    _reference.child(user.uid).child("Quiz").once().then((value){
      Map data = value.value;
      numberOfRows = data.length;
      print("Number of Rows = $numberOfRows");
    });
  }

  String dateString;
  var dateTime;
  var date;

  @override
  void initState() {
    super.initState();
    dateString = DateTime.now().toString();
    dateTime = DateTime.parse(dateString);
    date = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
  }

  var numberOfPeople = 0.0;
  var feelingHappy = 0.0;
  var feelingProductive = 0.0;

  void saveQuizData(){
    _reference.child(user.uid).child('Quiz').child(date).set({
      'number of people': numberOfPeople,
      'feeling happy': feelingHappy,
      'feeling productive': feelingProductive,
      'date': date,
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            icon: Icon(Icons.arrow_back_sharp)
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 30),

                  Center(
                    child: Text(
                      "Let's Start",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),

                  // Question No: 1
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 1',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How many people did you meet today?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Container(
                    child: Slider(
                      min: 0.0,
                      max: 20.0,
                      divisions: 20,
                      value: numberOfPeople,
                      activeColor: Colors.lightBlueAccent[700],
                      inactiveColor: Colors.grey,
                      onChanged: (value){
                        setState(() {
                          numberOfPeople = value;
                        });
                      },
                    ),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Number of People Meet = $numberOfPeople / 20',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),

                  // Question No: 2
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 2',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How happy do you feel today?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Container(
                    child: Slider(
                      min: 0.0,
                      max: 1000.0,
                      divisions: 20,
                      value: feelingHappy,
                      activeColor: Colors.lightBlueAccent[700],
                      inactiveColor: Colors.grey,
                      onChanged: (value){
                        setState(() {
                          feelingHappy = value;
                        });
                      },
                    ),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Feeling Happy = $feelingHappy / 1000',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),

                  // Question No: 3
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 3',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How productive do you feel today?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Container(
                    child: Slider(
                      min: 0.0,
                      max: 1000.0,
                      divisions: 20,
                      value: feelingProductive,
                      activeColor: Colors.lightBlueAccent[700],
                      inactiveColor: Colors.grey,
                      onChanged: (value){
                        setState(() {
                          feelingProductive = value;
                        });
                      },
                    ),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Feeling Productive = $feelingProductive / 1000',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),

                  // Finish Quiz
                  Container(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.lightBlueAccent[700],
                        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      onPressed: (){
                        saveQuizData();
                        numberofRows();
                        lastDate();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                      }, 
                      child: Text('FINISH'),
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}