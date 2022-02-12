import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Recommendation extends StatefulWidget {
  @override
  _RecommendationState createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  DatabaseReference _reference = FirebaseDatabase.instance
      .reference()
      .child('Users')
      .child(FirebaseAuth.instance.currentUser.uid)
      .child('Quiz');

  String dateString;
  var dateTime;
  var date;

  bool dataFound = false;

  String numberOfPeopleMessage = '';
  String feelingHappyMessage = '';
  String feelingProductiveMessage = '';

  String numberOfPeopleImage = '';
  String feelingHappyImage = '';
  String feelingProductiveImage = '';

  @override
  void initState() {
    super.initState();
    dateString = DateTime.now().toString();
    dateTime = DateTime.parse(dateString);
    date = "${dateTime.day}-${dateTime.month}-${dateTime.year}";

    rootFirebaseIsExists(_reference).then((value) {
      if (mounted) {
        setState(() {
          dataFound = value;
        });
      }
    });

    checkRecommendation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: dataFound
                ? ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 10,
                          child: Column(
                            children: [
                              Ink.image(
                                height: 200,
                                image: AssetImage(numberOfPeopleImage),
                                fit: BoxFit.fitWidth,
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    numberOfPeopleMessage,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 10,
                          child: Column(
                            children: [
                              Ink.image(
                                height: 200,
                                image: AssetImage(feelingHappyImage),
                                fit: BoxFit.fitWidth,
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    feelingHappyMessage,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 10,
                          child: Column(
                            children: [
                              Ink.image(
                                height: 200,
                                image: AssetImage(feelingProductiveImage),
                                fit: BoxFit.fitWidth,
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    feelingProductiveMessage,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Text('No Recommendation'),
                  )));
  }

  Future<bool> rootFirebaseIsExists(DatabaseReference databaseReference) async {
    DataSnapshot snapshot = await databaseReference.once();
    return snapshot != null;
  }

  checkRecommendation() {
    _reference.orderByChild(date).onValue.listen((event) {
      var snapshot = event.snapshot;
      if (snapshot.value[date]['number of people'] < 10) {
        print('Go out and meet more people');
        if (mounted) {
          setState(() {
            numberOfPeopleMessage = 'Go out and meet more people';
            numberOfPeopleImage = 'assets/meet people.jpg';
          });
        }
      }
      if (snapshot.value[date]['number of people'] >= 10) {
        print('Congratulations you met more people today');
        numberOfPeopleMessage = 'Congratulations!! you met more people today';
        numberOfPeopleImage = 'assets/congratulations meet more people.jpg';
      }

      if (snapshot.value[date]['feeling happy'] < 500) {
        print('Listen to your Favourite Tracks');
        feelingHappyMessage = 'Listen to your Favourite Tracks';
        feelingHappyImage = 'assets/favourite track.png';
      }
      if (snapshot.value[date]['feeling happy'] >= 500) {
        print('Treat yourself! You are happier today');
        feelingHappyMessage = 'Treat yourself!! You are happier today';
        feelingHappyImage = 'assets/feeling happy.png';
      }

      if (snapshot.value[date]['feeling productive'] < 500) {
        print('Take up some work');
        feelingProductiveMessage = 'Take up some work!!';
        feelingProductiveImage = 'assets/take up some work.png';
      }
      if (snapshot.value[date]['feeling productive'] >= 500) {
        print('Great you are working productively');
        feelingProductiveMessage = 'Great you are working productively!!';
        feelingProductiveImage = 'assets/feeling productive.png';
      }
    });
    rootFirebaseIsExists(_reference).then((value) {
      if (mounted) {
        setState(() {
          dataFound = value;
        });
      }
    });
  }
}
