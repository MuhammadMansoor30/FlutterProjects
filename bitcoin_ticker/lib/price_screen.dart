import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;   


class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedValue = 'USD';
  String convertedValue = '?';

  Map<String, String> coinValues = {};
  @override
  void initState() {
    super.initState();
    getValue();
  }
  void getValue() async {
    CoinData coinData = CoinData();
    try {
      var data = await coinData.getCoinData(selectedValue);
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  DropdownButton<String> androidDropDown(){
    List<DropdownMenuItem<String>> newList = []; 
    for(String currency in currenciesList) {   
      var items = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      newList.add(items);
    }
    return DropdownButton<String>(  
      value: selectedValue, 
      items: newList,
      onChanged: (value){   
        setState(() {
          selectedValue = value!; 

        });
      },
    );
  }
  CupertinoPicker iOSPicker(){
    List<Text> newList = [];
    for(String currency in currenciesList){
      var items = Text(currency);
      newList.add(items);
    }
    return CupertinoPicker(
      itemExtent: 32.0,  
      onSelectedItemChanged: (selectedIndex){ 
        selectedValue = currenciesList[selectedIndex] as String;

      },
      children: newList,   
    );
  }
  Widget getPicker(){
    var value;
    if(Platform.isIOS){

      value = iOSPicker();
    }
    else if(Platform.isAndroid){
      value = androidDropDown();
    }
    return value;
  }
  Column makeCard(){
    List<CryptoWidget> cryptoCard = [];
    for(String crypto in cryptoList){
      cryptoCard.add(
        CryptoWidget(convertedValue: coinValues[crypto], selectedValue: selectedValue, cryptoValue: crypto)
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCard
    );
  }

  @override
  Widget build(BuildContext context) {
    // getValue();
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          makeCard(),
          Container(
            height: 150.0,
            color: Colors.lightBlue,
            padding: EdgeInsets.only(bottom: 30.0),
            alignment: Alignment.center,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}

class CryptoWidget extends StatelessWidget {
  final String? convertedValue;
  final String selectedValue;
  final String cryptoValue;

  CryptoWidget({required this.convertedValue, required this.selectedValue, required this.cryptoValue});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoValue = $convertedValue $selectedValue',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
