import 'package:animations/animations.dart';
import 'package:crypto_list/screens/buying_crypto_screen.dart';
import 'package:crypto_list/screens/home_screen.dart';
import 'package:crypto_list/screens/notification_screen.dart';
import 'package:crypto_list/screens/price_screen.dart';
import 'package:crypto_list/screens/watchlist_screen.dart';
import 'package:crypto_list/style/style.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentTab = 0;
  Widget currentScreen = HomeScreen();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (
          child,
          primaryAnimation,
          secondaryAnimation,
        ) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: currentScreen,
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: kWhiteColorLight,
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          elevation: 20,
          backgroundColor: kPrimaryColorLight,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            setState(() {
              currentScreen = BuyingCryptoScreen();
              currentTab = 0;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        elevation: 0,
        child: Container(
          height: 40,
          child: Padding(
            padding: EdgeInsets.only(
              top: 12,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color:
                        currentTab == 0 ? kPrimaryColorLight : kGrayColorLight,
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = HomeScreen();
                      currentTab = 0;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.pie_chart_sharp,
                    color:
                        currentTab == 1 ? kPrimaryColorLight : kGrayColorLight,
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = WatchListScreen();
                      currentTab = 1;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.bar_chart,
                    color:
                        currentTab == 3 ? kPrimaryColorLight : kGrayColorLight,
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = PriceScreen();
                      currentTab = 3;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color:
                        currentTab == 4 ? kPrimaryColorLight : kGrayColorLight,
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = NotificationScreen();
                      currentTab = 4;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //       ),
      //       label: '',
      //     ),
      //   ],
      // ),
    );
  }
}
