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

   Map<dynamic, dynamic> values;

  String dateString;
  var dateTime;
  var date;

  bool dataFound = false;

  String numberOfPeopleMessage = '';
  String feelingHappyMessage = '';
  String feelingProductiveMessage = '';
  String timeSpendMessage = '';
  String troubleInRememberingThingMessage = '';
  String thoughtOfEndingLifeMessage = '';
  String temperOutburstMessage = '';
  String feelingScaredMessage = '';
  String troubleFallingAsleepMessage = '';
  String feelingHopelessMessage = '';
  String gotIntoArgumentsMessage = '';

  String numberOfPeopleImage = '';
  String feelingHappyImage = '';
  String feelingProductiveImage = '';
  String timeSpendImage = '';
  String troubleInRememberingThingImage = '';
  String thoughtOfEndingLifeImage = '';
  String temperOutburstImage = '';
  String feelingScaredImage = '';
  String troubleFallingAsleepImage = '';
  String feelingHopelessImage = '';
  String gotIntoArgumentsImage = '';

  var averageNumberOfPeople = 0.0;
  var averageFeelingHappy = 0.0;
  var averageFeelingProductive = 0.0;
  var averageTimeSpend = 0.0;
  var averageTroubleInRememberingThing = 0.0;
  var averageThoughtOfEndingLife = 0.0;
  var averageTemperOutburst = 0.0;
  var averageFeelingScared = 0.0;
  var averageTroubleFallingAsleep = 0.0;
  var averageFeelingHopeless = 0.0;
  var averageGotIntoArguments = 0.0;

  // Method to calculate the average of the previous data
  void averageOfPreviousData() async {
    var snapshot = await _reference.orderByChild(date).once();
    values = snapshot.value;
    if(values == null) {
      print("No Data Found");
      if(mounted) {
        setState(() {
          dataFound = false;
        });
      }
    }
    else {
      if(mounted) {
        setState(() {
          dataFound = true;
        });
      }

      print("Number of rows = "+values.length.toString());

      // If there is no data available a threshold value is set for the recommendation
      if(values.length == 1) {
        values.forEach((key, value) {
          print("It has only 1 record");
          print(values);

          averageNumberOfPeople = 25;
          averageFeelingHappy = 50;
          averageFeelingProductive = 50;
          averageTimeSpend = 12;
          averageTroubleInRememberingThing = 50;
          averageThoughtOfEndingLife = 50;
          averageTemperOutburst = 50;
          averageFeelingScared = 50;
          averageTroubleFallingAsleep = 50;
          averageFeelingHopeless = 50;
          averageGotIntoArguments = 50;
        });
      }
      // If data is present than all the data is fetched and the average is calculated for the recommendation
      else {
        values.forEach((key, values) {
          print("It has more than 1 record");
          print(values);

          // Fetching and adding all the previous data
          averageNumberOfPeople += values['number of people'];
          averageFeelingHappy += values['feeling happy'];
          averageFeelingProductive += values['feeling productive'];
          averageTimeSpend += values['time spend'];
          averageTroubleInRememberingThing += values['trouble in remembering thing'];
          averageThoughtOfEndingLife += values['thought of ending life'];
          averageTemperOutburst += values['temper outburst'];
          averageFeelingScared += values['feeling scared'];
          averageTroubleFallingAsleep += values['trouble falling asleep'];
          averageFeelingHopeless += values['feeling hopeless'];
          averageGotIntoArguments += values['got into arguments'];
        });
      }

      // Calculating the average
      setState(() {
        this.averageNumberOfPeople = averageNumberOfPeople / values.length;
        this.averageFeelingHappy = averageFeelingHappy / values.length;
        this.averageFeelingProductive = averageFeelingProductive / values.length;
        this.averageTimeSpend = averageTimeSpend / values.length;
        this.averageTroubleInRememberingThing = averageTroubleInRememberingThing / values.length;
        this.averageThoughtOfEndingLife = averageThoughtOfEndingLife / values.length;
        this.averageTemperOutburst = averageTemperOutburst / values.length;
        this.averageFeelingScared = averageFeelingScared / values.length;
        this.averageTroubleFallingAsleep = averageTroubleFallingAsleep / values.length;
        this.averageFeelingHopeless = averageFeelingHopeless / values.length;
        this.averageGotIntoArguments = averageGotIntoArguments / values.length;
      });

      print("Average Number of people meet = "+averageNumberOfPeople.toString());
      print("Average Feeling Happy = "+averageFeelingHappy.toString());
      print("Average Feeling Prodcutive = "+averageFeelingProductive.toString());
      print("Average Time Spend = "+averageTimeSpend.toString());
      print("Average Trouble in Remembering Things = "+averageTroubleInRememberingThing.toString());
      print("Average Thought of Ending Life = "+averageThoughtOfEndingLife.toString());
      print("Average Temper Outburst = "+averageTemperOutburst.toString());
      print("Average Feeling Scared = "+averageFeelingScared.toString());
      print("Average Trouble Falling Asleep = "+averageTroubleFallingAsleep.toString());
      print("Average Feeling Hopeless = "+averageFeelingHopeless.toString());
      print("Average got into Arguments = "+averageGotIntoArguments.toString());
    }  
  }

  @override
  void initState() {
    super.initState();
    dateString = DateTime.now().toString();
    dateTime = DateTime.parse(dateString);
    date = "${dateTime.day}-${dateTime.month}-${dateTime.year}";

    averageOfPreviousData();
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
                                image: AssetImage(timeSpendImage),
                                fit: BoxFit.fitWidth,
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    timeSpendMessage,
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
                                image: AssetImage(troubleInRememberingThingImage),
                                fit: BoxFit.fitWidth,
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    troubleInRememberingThingMessage,
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
                                image: AssetImage(thoughtOfEndingLifeImage),
                                fit: BoxFit.fitWidth,
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    thoughtOfEndingLifeMessage,
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
                                image: AssetImage(temperOutburstImage),
                                fit: BoxFit.fitWidth,
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    temperOutburstMessage,
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
                                image: AssetImage(feelingScaredImage),
                                fit: BoxFit.fitWidth,
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    feelingScaredMessage,
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
                                image: AssetImage(troubleFallingAsleepImage),
                                fit: BoxFit.fitWidth,
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    troubleFallingAsleepMessage,
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
                                image: AssetImage(feelingHopelessImage),
                                fit: BoxFit.fitWidth,
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    feelingHopelessMessage,
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
                                image: AssetImage(gotIntoArgumentsImage),
                                fit: BoxFit.fitWidth,
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    gotIntoArgumentsMessage,
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
                    ],
                  )
                : Center(
                    child: Text('No Recommendation'),
                  )));
  }

  // Method to get the Recommendation
  checkRecommendation() {
    _reference.orderByChild(date).onValue.listen((event) {
      var snapshot = event.snapshot;

      // If data of the current date is not available than it will display a 'No Recommendation' message
      if(snapshot.value[date] == null) {
        print("No Data Found");
        if(mounted) {
          setState(() {
            dataFound = false;
          });
        }
      }
      // If data is present than it will compare the current date data with the average of the previous data and based on that the Recommendations are displayed
      else {
        if(mounted) {
          setState(() {
            dataFound = true;
          });
        }

        // Number of People Recommendation
        if (snapshot.value[date]['number of people'] < averageNumberOfPeople) {
          print('Go out and meet more people');
          numberOfPeopleMessage = 'Go out and meet more people';
          numberOfPeopleImage = 'assets/meet people.jpg';
        }
        else {
          print('Congratulations you met more people today');
          numberOfPeopleMessage = 'You met more people today';
          numberOfPeopleImage = 'assets/congratulations meet more people.jpg';
        }

        // Feeling Happy Recommendation
        if (snapshot.value[date]['feeling happy'] < averageFeelingHappy) {
          print('Listen to your Favourite Tracks');
          feelingHappyMessage = 'Listen to your Favourite Tracks';
          feelingHappyImage = 'assets/favourite track.png';
        }
        else {
          print('Treat yourself! You are happier today');
          feelingHappyMessage = 'Treat yourself!! You are happier today';
          feelingHappyImage = 'assets/feeling happy.png';
        }

        // Feeling Productive Recommendation
        if (snapshot.value[date]['feeling productive'] < averageFeelingProductive) {
          print('Take up some work');
          feelingProductiveMessage = 'Take up some work!!';
          feelingProductiveImage = 'assets/take up some work.png';
        }
        else {
          print('Great you are working productively');
          feelingProductiveMessage = 'Great you are working productively!!';
          feelingProductiveImage = 'assets/feeling productive.png';
        }

        // Time Spend with near and dear ones Recommendation
        if (snapshot.value[date]['time spend'] < averageTimeSpend) {
          print('Spend more time with your near and dear ones');
          timeSpendMessage = 'Spend more time with your near and dear ones';
          timeSpendImage = 'assets/family.jpg';
        }
        else {
          print('You are spending good times with your near and dear ones');
          timeSpendMessage = 'You are spending good times with your near and dear ones';
          timeSpendImage = 'assets/congratulations meet more people.jpg';
        }

        // Feeling Trouble in Remembering Thing Recommendation
        if(snapshot.value[date]['trouble in remembering thing'] > averageTroubleInRememberingThing) {
          print('Include physical activity in your daily life');
          troubleInRememberingThingMessage = 'Include physical activity in your daily life';
          troubleInRememberingThingImage = 'assets/physical activity.jpg';
        }
        else {
          print('You are now able to remember things');
          troubleInRememberingThingMessage = 'You are now able to remember things';
          troubleInRememberingThingImage = 'assets/feeling productive.png';
        }

        // Thought of Ending your life Recommendation
        if(snapshot.value[date]['thought of ending life'] > averageThoughtOfEndingLife) {
          print('Talk to trusted family member, friend, or colleague about how you feel');
          thoughtOfEndingLifeMessage = 'Talk to trusted family member, friend, or colleague about how you feel';
          thoughtOfEndingLifeImage = 'assets/friends.jpg';
        }
        else {
          print("You are going great and don't think of such foolish thoughts");
          thoughtOfEndingLifeMessage = "You are going great and don't think of such foolish thoughts";
          thoughtOfEndingLifeImage = 'assets/feeling happy.png';
        }

        // Temper Outburst Recommendation
        if(snapshot.value[date]['temper outburst'] > averageTemperOutburst) {
          print('Inculcate Meditation in your daily life');
          temperOutburstMessage = 'Inculcate Meditation in your daily life';
          temperOutburstImage = 'assets/meditation.jpg';
        }
        else {
          print('You are improving in controlling your temper');
          temperOutburstMessage = 'You are improving in controlling your temper';
          temperOutburstImage = 'assets/feeling productive.png';
        }

        // Feeling Scared Recommendation
        if(snapshot.value[date]['feeling scared'] > averageFeelingScared) {
          print("Don't get afraid face your fear");
          feelingScaredMessage = "Don't get afraid face your fear";
          feelingScaredImage = 'assets/fear.jpg';
        }
        else {
          print('Great you are facing your fear instead of getting scared');
          feelingScaredMessage = 'Great you are facing your fear instead of getting scared';
          feelingScaredImage = 'assets/congratulations meet more people.jpg';
        }

        // Trouble Falling Asleep Recommendation
        if(snapshot.value[date]['trouble falling asleep'] > averageTroubleFallingAsleep) {
          print('Avoid using much of the Smartphone');
          troubleFallingAsleepMessage = 'Avoid using much of the Smartphone';
          troubleFallingAsleepImage = 'assets/smartphone.jpg';
        }
        else {
          print('You are improving in your sleep pattern');
          troubleFallingAsleepMessage = 'You are improving in your sleep pattern';
          troubleFallingAsleepImage = 'assets/feeling happy.png';
        }

        // Feeling Hopeless Recommendation
        if(snapshot.value[date]['feeling hopeless'] > averageFeelingHopeless) {
          print('Set small and tangible goals');
          feelingHopelessMessage = 'Set small and tangible goals';
          feelingHopelessImage = 'assets/goals.jpg';
        }
        else {
          print('You are doing progress and achieving your goals');
          feelingHopelessMessage = 'You are doing progress and achieving your goals';
          feelingHopelessImage = 'assets/feeling productive.png';
        }
        
        // Get into Arguments Recommendation
        if(snapshot.value[date]['got into arguments'] > averageGotIntoArguments) {
          print('Listen and Understand others point of view');
          gotIntoArgumentsMessage = 'Listen and Understand others point of view';
          gotIntoArgumentsImage = 'assets/listen.jpg';
        }
        else {
          print('You are becoming good and understanding person');
          gotIntoArgumentsMessage = 'You are becoming good and understanding person';
          gotIntoArgumentsImage = 'assets/congratulations meet more people.jpg';
        }
      }
    });
  }
}