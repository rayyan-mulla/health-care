import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Screens/MainPage/home.dart';
import 'package:image_picker/image_picker.dart';

class Registration extends StatefulWidget {

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  File image;

  bool showLoading = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  DatabaseReference _reference = FirebaseDatabase.instance.reference().child('Users');

  final user = FirebaseAuth.instance.currentUser;
  
  Future uploadImage(BuildContext context) async {
    Reference firebaseStorage = FirebaseStorage.instance.ref().child('profile images/${user.uid}');
    await firebaseStorage.putFile(image);
    String url = await firebaseStorage.getDownloadURL();
  }

  void registerUser(){
    String name = nameController.text;
    String email = emailController.text;

    _reference.child(user.uid).set({
      'name': name,
      'email': email,
    });

    setState(() {
      showLoading = false;
    });
  }

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
      final temporaryImage = File(image.path);
      setState(() {
        this.image = temporaryImage;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 60),

                Center(
                  child: Text(
                    'Welcome to Health Care',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),

                SizedBox(height: 30),

                CircleAvatar(
                  maxRadius: 80.0,
                  backgroundColor: Colors.black,
                  backgroundImage: image != null ? FileImage(image) : NetworkImage('https://freesvg.org/img/abstract-user-flat-4.png'),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: (){
                            showModalBottomSheet(
                              context: context, 
                              builder: (context) => Wrap(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.camera_alt_rounded),
                                    title: Text('Camera'),
                                    onTap: (){
                                      Navigator.pop(context);
                                      pickImage(ImageSource.camera);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.image_rounded),
                                    title: Text('Gallery'),
                                    onTap: (){
                                      Navigator.pop(context);
                                      pickImage(ImageSource.gallery);
                                    },
                                  ),
                                ],
                              )
                            );
                          }, 
                          child: CircleAvatar(
                            backgroundColor: Colors.lightBlueAccent[700],
                            child: Icon(Icons.add_a_photo_rounded, color: Colors.white),
                          ),
                        )
                      )
                    ],
                  ),
                ),
                
                SizedBox(height: 30),

                Container(
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_rounded),
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                ),

                Container(
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_rounded),
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                ),

                SizedBox(height: 30),

                Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.lightBlue,
                        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      uploadImage(context);
                      registerUser();
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>
                        Scaffold(
                          backgroundColor: Colors.white,
                          body: Container(
                            child: Center(child: CircularProgressIndicator(),),
                          ),
                        )
                      ));
                      await Future.delayed(Duration(seconds: 5),(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                      });
                    },
                    child: Text('REGISTER'),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                )
              ],
            )
          ],
        )

      ),
    );
  }
}