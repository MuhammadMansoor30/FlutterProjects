import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BallApp()
   ),
  );
}
class BallApp extends StatefulWidget {
  const BallApp({Key? key}) : super(key: key);

  @override
  State<BallApp> createState() => _BallAppState();
}

class _BallAppState extends State<BallApp> {
  int ballNo = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Ask Me Anything"),
      ),
      body: Center(
        child: FlatButton(
         onPressed: (){
           setState(() {
             ballNo = Random().nextInt(5) + 1;
           });
         },
         child: Image.asset('images/ball$ballNo.png'),
        )
      )
    );
  }
}
