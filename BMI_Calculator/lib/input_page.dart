import 'package:bmi_calculator_prac/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'resuable_widget.dart';
import 'icon_widget.dart';
import 'bottom_button.dart';
import 'functionality.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage>{
  int height = 180;
  int weight = 50;
  int age = 16;
  int maleCardColor = kInactiveCardColor;
  int femaleCardColor = kInactiveCardColor;

  void updateColor(Gender gender){
    if(gender == Gender.male){
      maleCardColor = kCardColor;
      femaleCardColor = kInactiveCardColor;
    }
    else if(gender == Gender.female){
      femaleCardColor = kCardColor;
      maleCardColor = kInactiveCardColor;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableWidget(
                    onPress: (){
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    color: Color(maleCardColor),
                    cardChild: IconWidget(
                      text: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    onPress: (){
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    color: Color(femaleCardColor),
                    cardChild: IconWidget(
                      text: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableWidget(
              color: Color(kCardColor),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Color(0xFF8D8E98)
                        ),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableWidget(
                    color: Color(kCardColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            IconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ),
                Expanded(
                  child: ReusableWidget(
                    color: Color(kCardColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            IconButton(
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            text: "CALCULATE",
            onTap: (){
              Functionality func = Functionality(height: height, weight: weight);

              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ResultPage(
                    result: func.BMIResult(),
                    resultText: func.resultText(),
                    interpretation: func.interpretation(),
                  );
                }));
              });
            },
          )
        ],
      ),
    );
  }
}


enum Gender{
  male,
  female
}

class IconButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;

  IconButton({required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
    );
  }
}
