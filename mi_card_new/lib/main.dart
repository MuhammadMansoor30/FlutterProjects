import 'package:flutter/material.dart';

void main() {
  runApp(
    const myApp()
  );
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade800,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const CircleAvatar(  
                radius: 50.0,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage("images/OIP.png"),
              ),
              const Text(
                  "Muhammad Mansoor",
                style: TextStyle( 
                    fontFamily: "Lobster",
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              const Text(
                  "Flutter Developer",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  color: Colors.white,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox( 
                height: 20.0,
                child: Divider(
                  color: Colors.teal.shade200,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "+92 333 5437627",
                    style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 20.0,
                        color: Colors.teal.shade900
                    ),
                  ),
                ),
              ),
              Card(  
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                child: Padding( 
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: Colors.teal,
                      ),
                      SizedBox( 
                        width: 15.0,
                      ),
                      Text(
                        "muh.mansoor@gmail.com",
                        style: TextStyle(
                            fontFamily: "Ubuntu",
                            fontSize: 18.0,
                            color: Colors.teal.shade900
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
