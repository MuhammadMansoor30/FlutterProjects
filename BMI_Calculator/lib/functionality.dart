import 'dart:math';

class Functionality{
  final int height;
  final int weight;

  Functionality({required this.height, required this.weight});

  double _bmi = 0;

  String BMIResult(){
    double heightToCm = height/100;
    _bmi = weight / pow(heightToCm, 2);
    return _bmi.toStringAsFixed(1);
  }

  String resultText(){
    if(_bmi > 25){
      return "OVERWEIGHT";
    }
    else if(_bmi > 18.5){
      return "NORMAL";
    }
    else{
      return "UNDERWEIGHT";
    }
  }

  String interpretation(){
    if(_bmi > 25){
      return "You have higher than normal body weight. Try to exercise more.";
    }
    else if(_bmi > 18.5){
      return "You have a normal body weight. Good Job!";
    }
    else{
      return"You have lower than normal body weight. You can eat more.";
    }
  }
}