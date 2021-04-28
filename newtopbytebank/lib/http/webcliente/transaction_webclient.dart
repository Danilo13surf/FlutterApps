import 'dart:convert';

import 'package:http/http.dart';
import 'package:newtopbytebank/models/transactions.dart';

import '../webclient.dart';

final url = Uri.parse(
    'https://byteban-aa38b-default-rtdb.firebaseio.com/transactions.json?print=pretty');
    // 'https://byteban-aa38b-default-rtdb.firebaseio.com/transactions.json');

class TransactionWebClient {
  Future<List<Transactions>> findAll() async {
    final Response response = await client.get(url);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transactions.fromJson(json))
        .toList();
  }

  Future<Transactions> save(Transactions transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    await Future.delayed(Duration(seconds: 3));

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    if (response.statusCode == 200) {
      return Transactions.fromJson(jsonDecode(response.body));
    }

    throw HttpException(_getMessage(response.statusCode));
  }

  String _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
    }
    return 'unknown error';
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'there was an error submitting transaction',
    401: 'authentication failed',
    409: 'transaction already exists'
  };
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
