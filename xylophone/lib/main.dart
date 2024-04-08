import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const Xylophone());  


class Xylophone extends StatelessWidget {
  const Xylophone({Key? key}) : super(key: key);

  void playSound(int num){
    final player = AudioPlayer(); 
    player.play(AssetSource('note$num.wav'));
  }
  Expanded buildKey({required Color color, required int num}){ 
    return Expanded(
      child: FlatButton(
        color: color, 
        onPressed: (){     
          playSound(num);
        }, child: Text(""),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              buildKey(color: Colors.red, num: 1),
              buildKey(color: Colors.orange, num: 2),
              buildKey(color: Colors.yellow, num: 3),
              buildKey(color: Colors.green, num: 4),
              buildKey(color: Colors.teal, num: 5),
              buildKey(color: Colors.blue, num: 6),
              buildKey(color: Colors.purple, num: 7),
            ],
            ),
          ),
        ),
    );
  }
}
