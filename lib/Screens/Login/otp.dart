import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTP extends StatefulWidget {

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'OTP Verification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),

            Center(
              child: Text(
                'Please Enter the OTP send to ',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child:Container(
                    child: TextFormField(
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: Offstage(),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    width: 40,
                  )
                ),

                SizedBox(width: 10),

                Flexible(
                  child:Container(
                    child: TextFormField(
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: Offstage(),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    width: 40,
                  )
                ),

                SizedBox(width: 10),

                Flexible(
                  child:Container(
                    child: TextFormField(
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: Offstage(),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    width: 40,
                  )
                ),

                SizedBox(width: 10),

                Flexible(
                  child:Container(
                    child: TextFormField(
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: Offstage(),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    width: 40,
                  )
                ),

                SizedBox(width: 10),

                Flexible(
                  child:Container(
                    child: TextFormField(
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: Offstage(),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    width: 40,
                  )
                ),

                SizedBox(width: 10),

                Flexible(
                  child:Container(
                    child: TextFormField(
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: Offstage(),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    width: 40,
                  )
                ),
              ],
            ),

            SizedBox(height: 60),

            Container(
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.lightBlue,
                    textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                onPressed: () {},
                child: Text('VERIFY'),
              ),
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            )
          ],
        )
      ),
    );
  }
}