import 'package:crypto_list/component/custom_crypto_appbar.dart';
import 'package:crypto_list/style/style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomCryptoAppBar(
        appBar: AppBar(),
        title: 'Home',
        iconButton: IconButton(
          icon: Icon(
            Icons.subject_outlined,
            color: kPrimaryTextColor,
          ),
          onPressed: () {},
        ),
      ),
      backgroundColor: kLightBackground,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: kGrayColorLight,
            shape: BoxShape.circle,
            border: Border.all(
              color: kWhiteColorLight,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
