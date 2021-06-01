import 'dart:async';
import 'dart:convert';

import 'package:crypto_list/component/custom_crypto_appbar.dart';
import 'package:crypto_list/component/single_crypto.dart';
import 'package:crypto_list/model/crypto_model.dart';
import 'package:crypto_list/style/style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WatchListScreen extends StatefulWidget {
  @override
  _WatchListScreenState createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  Future<List<Crypto>> cryptocurrencies;
  Timer timer;

  String baseUrl =
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=7';

  Map<String, String> headers = {
    "Content-type": "application/json",
    "X-CMC_PRO_API_KEY": "df9b09d5-fa81-4978-8aad-b8f26086a622",
  };

  Future<List<Crypto>> fetchCryptoCurrencies() async {
    http.Response response = await http.get(
      Uri.parse(baseUrl),
      headers: headers,
    );

    final Map<String, dynamic> apiBody = json.decode(response.body);
    List<dynamic> responseBody = apiBody['data'];
    final statusCode = response.statusCode;

    if (statusCode != 200 || responseBody == null) {
      throw Exception("An error ocurred : [Status Code : $statusCode]");
    }

    var cryptoResponseBody =
        responseBody.map((c) => new Crypto.fromMap(c)).toList();

    return cryptoResponseBody;
  }

  @override
  void initState() {
    super.initState();
    cryptocurrencies = fetchCryptoCurrencies();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomCryptoAppBar(
        appBar: AppBar(),
        title: 'Watchlist',
        iconButton: IconButton(
          icon: Icon(
            Icons.subject,
            color: kPrimaryTextColor,
          ),
          onPressed: () {},
        ),
      ),
      backgroundColor: kLightBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Container(
          child: Center(
            child: FutureBuilder<List<Crypto>>(
              future: cryptocurrencies,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData &&
                    snapshot.data != null) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      double priceRounded = snapshot.data[index].price;

                      String logo =
                          'https://cryptoicons.org/api/icon/${snapshot.data[index].symbol.toLowerCase()}/200';

                      return SingleCrypto(
                        cryptoName: snapshot.data[index].name,
                        cryptoLogo: logo,
                        // cryptoLogo:
                        //     'https://cryptoicons.org/api/icon/${snapshot.data[index].symbol.toLowerCase()}/100',
                        cryptoPrice: priceRounded.toStringAsFixed(2),
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
    // 'assets/images/profile_icon.png'
    // return Container(
    //   child: Center(
    //     child: FutureBuilder<List<Crypto>>(
    //       future: fetchCryptoCurrencies(),
    //       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    //         if (snapshot.connectionState == ConnectionState.done &&
    //             snapshot.hasData &&
    //             snapshot.data != null) {
    //           return ListView.builder(
    //             itemCount: snapshot.data.length,
    //             itemBuilder: (context, index) {
    //               return Text(snapshot.data[index].name);
    //             },
    //           );
    //         }
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
