import 'package:flutter/material.dart';

class BuyingCryptoScreen extends StatefulWidget {
  @override
  _BuyingCryptoScreenState createState() => _BuyingCryptoScreenState();
}

class _BuyingCryptoScreenState extends State<BuyingCryptoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff0f3f5),
      ),
      child: Center(
        child: Text('Buy Crypto Screen'),
      ),
    );
  }
}
