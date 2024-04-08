import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '4C113B5A-D894-4B2F-8A84-C19B2AD7C8A1';
const apiKey2 = 'DE0BAF4B-F240-4A2F-B91B-992A673F94B2';

class CoinData {

  Future getCoinData(String selectedCurrency) async {
    try{
      Map<String, String> cryptoPrice = {};
      for(String crypto in cryptoList){
        print(crypto);
        http.Response response = await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/$crypto/$selectedCurrency?apikey=$apiKey2'));

        if(response.statusCode == 200){
          var body = response.body;
          double rate = jsonDecode(body)['rate'];
          cryptoPrice[crypto] = rate.toStringAsFixed(0);  // Fixing rate as value to key crypto in a map
        }
        else{
          print(response.statusCode);
        }
      }
      return cryptoPrice;
    }
    catch(e){
      print(e);
    }
  }
}