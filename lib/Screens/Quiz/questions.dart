import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Screens/MainPage/home.dart';
import 'package:health_care/Screens/Recommendation/recommendation.dart';

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
  var timeSpend = 0.0;
  String feelingWorried;
  String mentalHealthAffectedRelationships;
  String takingMedications;

  void saveQuizData(){
    _reference.child(user.uid).child('Quiz').child(date).set({
      'number of people': numberOfPeople,
      'feeling happy': feelingHappy,
      'feeling productive': feelingProductive,
      'feeling worried': feelingWorried,
      'time spend': timeSpend,
      'mental health affected relationships': mentalHealthAffectedRelationships,
      'taking medications': takingMedications,
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

                  // Question No: 4
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 4',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Are you feeling worried about something that you were enable to sleep at night?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Row(
                    children: [
                      Radio(
                        value: 'Yes', 
                        groupValue: feelingWorried, 
                        onChanged: (value){
                          setState(() {
                            feelingWorried = value;
                          });
                        }
                      ),
                      Text("Yes", style: TextStyle(fontSize: 16))
                    ],
                  ),

                  Row(
                    children: [
                      Radio(
                        value: 'No', 
                        groupValue: feelingWorried, 
                        onChanged: (value){
                          setState(() {
                            feelingWorried = value;
                          });
                        }
                      ),
                      Text("No", style: TextStyle(fontSize: 16))
                    ],
                  ),

                  // Question No: 5
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 5',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'On daily basis how much time do you spend with your near and dear ones?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Container(
                    child: Slider(
                      min: 0.0,
                      max: 6.0,
                      divisions: 6,
                      value: timeSpend,
                      activeColor: Colors.lightBlueAccent[700],
                      inactiveColor: Colors.grey,
                      onChanged: (value){
                        setState(() {
                          timeSpend = value;
                        });
                      },
                    ),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Time Spend = $timeSpend / 6',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),

                  //Question No: 6
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 6',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How often has your mental health affected your relationships?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Row(
                    children: [
                      Radio(
                        value: 'Very Often', 
                        groupValue: mentalHealthAffectedRelationships, 
                        onChanged: (value){
                          setState(() {
                            mentalHealthAffectedRelationships = value;
                          });
                        }
                      ),
                      Text("Very Often", style: TextStyle(fontSize: 16))
                    ],
                  ),

                  Row(
                    children: [
                      Radio(
                        value: 'Somewhat Often', 
                        groupValue: mentalHealthAffectedRelationships, 
                        onChanged: (value){
                          setState(() {
                            mentalHealthAffectedRelationships = value;
                          });
                        }
                      ),
                      Text("Somewhat Often", style: TextStyle(fontSize: 16))
                    ],
                  ),

                  Row(
                    children: [
                      Radio(
                        value: 'Not so Often', 
                        groupValue: mentalHealthAffectedRelationships, 
                        onChanged: (value){
                          setState(() {
                            mentalHealthAffectedRelationships = value;
                          });
                        }
                      ),
                      Text("Not so Often", style: TextStyle(fontSize: 16))
                    ],
                  ),

                  // Question No: 7
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 7',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Are you currently taking any medications?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Row(
                    children: [
                      Radio(
                        value: 'Yes', 
                        groupValue: takingMedications, 
                        onChanged: (value){
                          setState(() {
                            takingMedications = value;
                          });
                        }
                      ),
                      Text("Yes", style: TextStyle(fontSize: 16))
                    ],
                  ),

                  Row(
                    children: [
                      Radio(
                        value: 'No', 
                        groupValue: takingMedications, 
                        onChanged: (value){
                          setState(() {
                            takingMedications = value;
                          });
                        }
                      ),
                      Text("No", style: TextStyle(fontSize: 16))
                    ],
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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
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