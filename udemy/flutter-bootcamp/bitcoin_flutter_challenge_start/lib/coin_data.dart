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
// const apiKey = 'YOUR-API-KEY-HERE';

class CoinData {
  Future<double> getCoinData(String? currency) async {
    if (currency == null) {
      return 0;
    }

    var uri = Uri.parse('$coinAPIURL/BTC/$currency');
    var response = await http.get(uri, headers: {'Accept': 'text/plain'});
    double rate = double.parse(response.body);
    return rate;
  }
}
