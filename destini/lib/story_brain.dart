import 'package:flutter/material.dart';

import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;
  List<Story> _storyData = [
    Story(
        text:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        answer1: 'I\'ll hop in. Thanks for the help!',
        answer2: 'Better ask him if he\'s a murderer first.'),
    Story(
        text: 'He nods slowly, unphased by the question.',
        answer1: 'At least he\'s honest. I\'ll climb in.',
        answer2: 'Wait, I know how to change a tire.'),
    Story(
        text:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        answer1: 'I love Elton John! Hand him the cassette tape.',
        answer2: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        text:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        answer1: 'Restart',
        answer2: ''),
    Story(
        text:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        answer1: 'Restart',
        answer2: ''),
    Story(
        text:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        answer1: 'Restart',
        answer2: '')
  ];

  String getStory(){
    return _storyData[_storyNumber].storyText;
  }

  String getAnswer1(){
    return _storyData[_storyNumber].ans1;
  }

  String getAnswer2(){
    return _storyData[_storyNumber].ans2;
  }

  void reset(){
    _storyNumber = 0;
  }

  String nextStory(int userChoice){

    if (_storyNumber == 0 && userChoice == 1){
      _storyNumber += 2;
    }
    else if(_storyNumber == 0 && userChoice == 2){
      _storyNumber++;
    }
    else if(_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5){
      reset();
    }
    else if(_storyNumber == 1 && userChoice == 1){
      _storyNumber++;
    }
    else if(_storyNumber == 1 && userChoice == 2){
      _storyNumber += 2;
    }
    else if(_storyNumber == 2 && userChoice == 1){
      _storyNumber += 3;
    }
    else if(_storyNumber == 2 && userChoice == 2){
      _storyNumber += 2;
    }
    print(_storyNumber);
    return _storyData[_storyNumber].storyText;
  }

  bool buttonVisible(){
    bool value = true;
    if (_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2){
      value = true;
    }
    else if(_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5){
      value = false;
    }
    return value;
  }
}
