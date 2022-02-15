import 'package:flutter/material.dart';
import 'package:health_care/Screens/Profile/profile.dart';
import 'package:health_care/Screens/Quiz/quiz.dart';
import 'package:health_care/Screens/Recommendation/recommendation.dart';
import 'package:health_care/Screens/Report/report.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int currentIndex = 0;

  final tabs = [
    Quiz(),
    Recommendation(),
    Report(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Health Care'),
          backgroundColor: Colors.lightBlueAccent[700],
        ),
        backgroundColor: Colors.white,
        body: tabs[currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.lightBlueAccent[700],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home"), backgroundColor: Colors.lightBlueAccent[700],),
            BottomNavigationBarItem(icon: Icon(Icons.recommend_rounded), title: Text("Recommendation"), backgroundColor: Colors.lightBlueAccent[700],),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), title: Text("Report"), backgroundColor: Colors.lightBlueAccent[700],),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp), title: Text("Profile"), backgroundColor: Colors.lightBlueAccent[700],),
          ],
          onTap: (index){
            setState(() {
              currentIndex = index;
            });
          }
        ),
      )
     );
  } 
}