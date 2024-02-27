//2. Import the required packages.
// ignore_for_file: avoid_print

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

const coinAPIURL = 'https://api.coingate.com/v2/rates/merchant';

class CoinData {
  Future getCoinData(String? currency) async {
    if (currency == null) {
      return 0;
    }

    var requestUri = Uri.parse('$coinAPIURL/BTC/$currency');
    http.Response response =
        await http.get(requestUri, headers: {'accept': 'text/plain'});
    if (response.statusCode == 200) {
      var lastPrice = double.parse(response.body);
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
