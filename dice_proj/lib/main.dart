import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown.shade800,
        appBar: AppBar(
          title: Text("Dicee"),
          backgroundColor: Colors.brown.shade900,
        ),
        body: const DiceApp(),
      ),
    ),
  );
}
class DiceApp extends StatefulWidget { 
  const DiceApp({Key? key}) : super(key: key);

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int leftDiceNo = 1;
  int rightDiceNo = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded( 
              child: FlatButton(
                onPressed: (){
                  setState(() {  
                    leftDiceNo = Random().nextInt(6) +1;
                    rightDiceNo = Random().nextInt(6) + 1;
                  });
                },
                child: Image.asset(
                    'images/dice$leftDiceNo.png' 
                ),
              ) 
          ),
          Expanded(
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    rightDiceNo = Random().nextInt(6) + 1;
                    leftDiceNo = Random().nextInt(6) +1;
                  });
                },
                child: Image.asset(
                    'images/dice$rightDiceNo.png'),
              )
          ),
        ],
      ),
    );
  }
}