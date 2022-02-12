import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Screens/Login/login.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final _auth = FirebaseAuth.instance;

  final user = FirebaseAuth.instance.currentUser;

  DatabaseReference _reference = FirebaseDatabase.instance.reference().child('Users');

  var imageUrl;
  String name = '';
  String email = '';

  Future getImageUrl(BuildContext context) async {
    final firebaseStorage = FirebaseStorage.instance.ref().child('profile images/${user.uid}');
    imageUrl = await firebaseStorage.getDownloadURL() as String;
    print(imageUrl);
  }

  @override
  void initState(){
    super.initState();

    getImageUrl(context);

    _reference.child(user.uid).child('name').once().then((DataSnapshot snapshot) {
      setState(() {
        name = snapshot.value;
      });
    });

    _reference.child(user.uid).child('email').once().then((DataSnapshot snapshot) {
      setState(() {
        email = snapshot.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[

                SizedBox(height: 20,),

                CircleAvatar(
                  maxRadius: 80.0,
                  backgroundColor: Colors.black,
                  backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : NetworkImage('https://freesvg.org/img/abstract-user-flat-4.png'),
                ),

                SizedBox(height: 20,),

                ListTile(
                  leading: Icon(Icons.person_rounded),
                  title: Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.black54
                    ),
                  ),
                  subtitle: Text(
                    name,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),

                ListTile(
                  leading: Icon(Icons.email_rounded),
                  title: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black54
                    ),
                  ),
                  subtitle: Text(
                    email,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _auth.signOut();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
        },
        child: Icon(Icons.logout_rounded),
      ),
    );
  }
}
