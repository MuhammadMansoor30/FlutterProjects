import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[500],
        appBar: AppBar(
          title: Text('I Am Rich'),
          backgroundColor: Colors.teal[900],
        ),
        body: const Center(
          child: Image(
            // Image Widget allows us to add image.  We can add Two type of Images Network Image from Online Asset Image from PC
            image: AssetImage('images/diamond.png'),
            //NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3Wjd-Cak78mooEfHTx64D7xhFtgBMZRFiiQ&usqp=CAU'),
          ),
        ),
      ),
    ),
  );
}
