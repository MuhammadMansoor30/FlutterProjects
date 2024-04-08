import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/components/button_widget.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.white, end: Colors.black54).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {
      });
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Hero(
                        tag: 'logo',
                        child: Container(
                          child: Image.asset('images/logo.png'),
                          height: 60.0,
                        ),
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                              'Chat App',
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 45.0,
                                fontWeight: FontWeight.w900,
                              )
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  ButtonWidget(
                    text: 'Log In',
                    color: Colors.orangeAccent,
                    onPressed: (){
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                  ),
                  ButtonWidget(
                    text: "Register",
                    color: Colors.deepOrangeAccent,
                    onPressed: (){
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Future<DocumentSnapshot> getData() async {
  await Firebase.initializeApp();
  return await FirebaseFirestore.instance
      .collection("users")
      .doc("docID")
      .get();
}

