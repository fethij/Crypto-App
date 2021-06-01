import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/crypto_model.dart';

class CryptoListScreen extends StatefulWidget {
  @override
  _CryptoListScreenState createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  String cryptoUrl = "https://api.coingecko.com/api/v3/coins/list/?limit=10";

  Future<List<Crypto>> fetchCryptoCurrencies() async {
    http.Response response = await http.get(Uri.parse(cryptoUrl));

    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;

    print("Got response from Crypto: ");

    if (statusCode != 200 || responseBody == null) {
      throw Exception("An error ocurred : [Status Code : $statusCode]");
    }

    var cryptoResponseBody =
        responseBody.map((c) => new Crypto.fromMap(c)).toList();

    return cryptoResponseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Crypto List'),
        ),
        body: FutureBuilder<List<Crypto>>(
          future: fetchCryptoCurrencies(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data[index].name);
              },
            );
          },
        ));
  }
}
