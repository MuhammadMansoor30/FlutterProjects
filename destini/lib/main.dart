import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(const DestiniApp());
}

class DestiniApp extends StatelessWidget {
  const DestiniApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}
class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storyBrain = StoryBrain();
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(   
          image: DecorationImage(
            image: AssetImage("images/background.png")
          )
        ),
        padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 25.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                )
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      visible = true;
                      storyBrain.nextStory(1);
                      if(storyBrain.buttonVisible() == false){
                        visible = false;
                      }
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    storyBrain.getAnswer1(),
                    style: TextStyle(
                      fontSize: 15.0
                    ),
                  ),
                )
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: visible,
                  child: FlatButton(
                    color: Colors.blue,
                    onPressed: (){
                      setState(() {
                        visible = true;
                        storyBrain.nextStory(2);
                        if(storyBrain.buttonVisible() == false){
                          visible = false;
                        }
                      });
                    },
                    child: Text(
                      storyBrain.getAnswer2(),
                      style: TextStyle(
                        fontSize: 15.0
                      ),
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
