import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Screens/Recommendation/show%20recommendation.dart';

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
  var troubleInRememberingThing = 0.0;
  var thoughtOfEndingLife = 0.0;
  var temperOutburst = 0.0;
  var feelingScared = 0.0;
  var troubleFallingAsleep = 0.0;
  var feelingHopeless = 0.0;
  var gotIntoArguments = 0.0;
  String feelingWorried;
  String mentalHealthAffectedRelationships;
  String takingMedications;
  String poorAppetite;

  // Method to save the Quiz data
  void saveQuizData(){
    _reference.child(user.uid).child('Quiz').child(date).set({
      'number of people': numberOfPeople,
      'feeling happy': feelingHappy,
      'feeling productive': feelingProductive,
      'feeling worried': feelingWorried,
      'time spend': timeSpend,
      'mental health affected relationships': mentalHealthAffectedRelationships,
      'trouble in remembering thing': troubleInRememberingThing,
      'taking medications': takingMedications,
      'thought of ending life': thoughtOfEndingLife,
      'temper outburst': temperOutburst,
      'feeling scared': feelingScared,
      'trouble falling asleep': troubleFallingAsleep,
      'feeling hopeless': feelingHopeless,
      'got into arguments': gotIntoArguments,
      'poor appetite': poorAppetite,
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
                      max: 50.0,
                      divisions: 50,
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
                        'Number of People Meet = $numberOfPeople / 50',
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
                      max: 100.0,
                      divisions: 10,
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
                        'Feeling Happy = $feelingHappy / 100',
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
                      max: 100.0,
                      divisions: 10,
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
                        'Feeling Productive = $feelingProductive / 100',
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
                      max: 24.0,
                      divisions: 24,
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
                        'Time Spend = $timeSpend / 24',
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
                        'How frequently you feel trouble in remembering thing?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Container(
                    child: Slider(
                      min: 0.0,
                      max: 100.0,
                      divisions: 10,
                      value: troubleInRememberingThing,
                      activeColor: Colors.lightBlueAccent[700],
                      inactiveColor: Colors.grey,
                      onChanged: (value){
                        setState(() {
                          troubleInRememberingThing = value;
                        });
                      },
                    ),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Trouble in remembering things = $troubleInRememberingThing / 100',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),

                  // Question No: 8
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 8',
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

                  // Question No: 9
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 9',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How frequently you have thought of ending your life?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Container(
                    child: Slider(
                      min: 0.0,
                      max: 100.0,
                      divisions: 10,
                      value: thoughtOfEndingLife,
                      activeColor: Colors.lightBlueAccent[700],
                      inactiveColor: Colors.grey,
                      onChanged: (value){
                        setState(() {
                          thoughtOfEndingLife = value;
                        });
                      },
                    ),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Thought of Ending Life = $thoughtOfEndingLife / 100',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),

                  // Question No: 10
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 10',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "How frequently you have temper outburst you can't control?",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Container(
                    child: Slider(
                      min: 0.0,
                      max: 100.0,
                      divisions: 10,
                      value: temperOutburst,
                      activeColor: Colors.lightBlueAccent[700],
                      inactiveColor: Colors.grey,
                      onChanged: (value){
                        setState(() {
                          temperOutburst = value;
                        });
                      },
                    ),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Temper Outburst = $temperOutburst / 100',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),

                  // Question No: 11
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 11',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How frequently you feel scared for no reason?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Container(
                    child: Slider(
                      min: 0.0,
                      max: 100.0,
                      divisions: 10,
                      value: feelingScared,
                      activeColor: Colors.lightBlueAccent[700],
                      inactiveColor: Colors.grey,
                      onChanged: (value){
                        setState(() {
                          feelingScared = value;
                        });
                      },
                    ),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Feeling Scared = $feelingScared / 100',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),

                  // Question No: 12
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 12',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How often you have trouble falling asleep?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Container(
                    child: Slider(
                      min: 0.0,
                      max: 100.0,
                      divisions: 10,
                      value: troubleFallingAsleep,
                      activeColor: Colors.lightBlueAccent[700],
                      inactiveColor: Colors.grey,
                      onChanged: (value){
                        setState(() {
                          troubleFallingAsleep = value;
                        });
                      },
                    ),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Trouble Falling Asleep = $troubleFallingAsleep / 100',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),

                  // Question No: 13
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 13',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How often you feel hopeless about your future?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Container(
                    child: Slider(
                      min: 0.0,
                      max: 100.0,
                      divisions: 10,
                      value: feelingHopeless,
                      activeColor: Colors.lightBlueAccent[700],
                      inactiveColor: Colors.grey,
                      onChanged: (value){
                        setState(() {
                          feelingHopeless = value;
                        });
                      },
                    ),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Feeling Hopeless = $feelingHopeless / 100',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),

                  // Question No: 14
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 14',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How frequently do you get into arguments?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Container(
                    child: Slider(
                      min: 0.0,
                      max: 100.0,
                      divisions: 10,
                      value: gotIntoArguments,
                      activeColor: Colors.lightBlueAccent[700],
                      inactiveColor: Colors.grey,
                      onChanged: (value){
                        setState(() {
                          gotIntoArguments = value;
                        });
                      },
                    ),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Got into Arguments = $gotIntoArguments / 100',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),

                  // Question No: 15
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question No: 15',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  ),

                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Do you have a poor appetite?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  ),

                  Row(
                    children: [
                      Radio(
                        value: 'Yes', 
                        groupValue: poorAppetite, 
                        onChanged: (value){
                          setState(() {
                            poorAppetite = value;
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
                        groupValue: poorAppetite, 
                        onChanged: (value){
                          setState(() {
                            poorAppetite = value;
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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ShowRecommendation()));
                      }, 
                      child: Text('FINISH'),
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 20),
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