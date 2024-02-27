// ignore_for_file: avoid_print

import 'dart:collection';
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
  Future<Map<String, double>> getCoinData(String? selectedCurrency) async {
    var map = HashMap<String, double>();

    for (var cryptoCurrency in cryptoList) {
      var requestUri = Uri.parse('$coinAPIURL/$cryptoCurrency/$selectedCurrency');
      http.Response response =
          await http.get(requestUri, headers: {'accept': 'text/plain'});
      if (response.statusCode == 200) {
        var lastPrice = double.parse(response.body);
        map[cryptoCurrency] = lastPrice;
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }

    return map;
  }
}
