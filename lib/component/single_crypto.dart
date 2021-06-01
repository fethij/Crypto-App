import 'package:crypto_list/style/style.dart';
import 'package:flutter/material.dart';

class SingleCrypto extends StatelessWidget {
  final String cryptoName, cryptoLogo, cryptoPrice;

  const SingleCrypto({
    Key key,
    this.cryptoName,
    this.cryptoLogo,
    this.cryptoPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      child: Container(
        height: 80,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Color(0xffededed),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(children: [
                CircleAvatar(
                  child: Image.network(cryptoLogo),
                  backgroundColor: kLightBackground,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  cryptoName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$ $cryptoPrice',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '0 USD',
                  style: TextStyle(
                    color: kSecondaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
