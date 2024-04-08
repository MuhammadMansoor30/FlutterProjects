import 'package:bmi_calculator_prac/constants.dart';
import 'package:bmi_calculator_prac/resuable_widget.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String resultText;
  final String interpretation;

  ResultPage({required this.result, required this.resultText, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator"
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text("Your Results",
                  style: kTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableWidget(
              color: Color(kCardColor),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    result,
                    style: kResultStyle,
                  ),
                  Text(
                    interpretation,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            text: "RE-CALCULATE",
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
