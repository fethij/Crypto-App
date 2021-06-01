import 'package:crypto_list/component/custom_bottom_navigation_bar.dart';
import 'package:crypto_list/style/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => CustomBottomNavigationBar(),
      },
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: kPrimaryTextColor,
          ),
        ),
      ),
    );
  }
}
