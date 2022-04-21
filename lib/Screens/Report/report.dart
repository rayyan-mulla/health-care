import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final user = FirebaseAuth.instance.currentUser;
  DatabaseReference _reference = FirebaseDatabase.instance.reference().child('Users');

  bool animate = false;

  String dateString;
  var dateTime;
  var date;

  bool dataFound = false;

  @override
  void initState() {
    super.initState();
    dateString = DateTime.now().toString();
    dateTime = DateTime.parse(dateString);
    date = "${dateTime.day}-${dateTime.month}-${dateTime.year}";

    _reference.child(user.uid).child('Quiz').once().then((DataSnapshot snapshot) {
      // If the Quiz data is not found it will display a 'No Data Found' message
      if(snapshot.value == null) {
        print("No data found");
        if(mounted) {
          setState(() {
            dataFound = false;
          });
        }
      }
      // If the Quiz data is present than it will display the Report
      else {
        if(mounted) {
          setState(() {
            dataFound = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: dataFound ? FirebaseAnimatedList(
          query: _reference.child(user.uid).child('Quiz').orderByChild(date).limitToLast(7),
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
            if(snapshot.value == null) {
              print("No data Found");
              dataFound = false;
              return Container(
                child: Center(
                  child: Text('No Data'),
                ),
              );
            }
            else {
              dataFound = true;
              return Container(
                width: double.infinity,
                height: 500,
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  elevation: 10,
                  child: Column(
                    children: [

                      SizedBox(height: 10,),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Icon(Icons.calendar_today_rounded),
                          
                          SizedBox(width: 5,),

                          Text(
                            snapshot.value['date'].toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                        ],
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Text(
                            "Number of People Meet: "+snapshot.value['number of people'].toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            "How much Productive you were Feeling: "+snapshot.value['feeling productive'].toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            "How Happy you were feeling: "+snapshot.value['feeling happy'].toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            "Were you worried about something: "+snapshot.value['feeling worried'].toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            "Time you spend with your near and dear ones: "+snapshot.value['time spend'].toString()+" hr",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            "How often your mental health affected your relationships: "+snapshot.value['mental health affected relationships'].toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            "Taking any Medications: "+snapshot.value['taking medications'].toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            "Trouble in Remembering Things: "+snapshot.value['trouble in remembering thing'].toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            "Thought of Ending your Life: "+snapshot.value['thought of ending life'].toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            "Temper Outburst: "+snapshot.value['temper outburst'].toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            "Feeling Scared for no reason: "+snapshot.value['feeling scared'].toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            "Trouble in Falling Asleep: "+snapshot.value['trouble falling asleep'].toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            "Thoughts about Hopeless Future: "+snapshot.value['feeling hopeless'].toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            "Frequent invovement in Arguments: "+snapshot.value['got into arguments'].toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            "Poor Appetite: "+snapshot.value['poor appetite'].toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )
                      ),

                    ],
                  ),
                ),
              );
            }
          }
        )
        : Center(
          child: Text("No Data Found"),
        )
      )
    );
  }
}