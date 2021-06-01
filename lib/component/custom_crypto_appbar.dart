import 'package:crypto_list/style/style.dart';
import 'package:flutter/material.dart';

class CustomCryptoAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;
  final IconButton iconButton;

  CustomCryptoAppBar({
    Key key,
    this.appBar,
    this.title,
    this.iconButton,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBar.preferredSize.height),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: kShadowLightColor,
              offset: Offset(0, 3.0),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: kWhiteColorLight,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconButton,
              Text(
                title,
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
              ),
            ],
          ),
          titleSpacing: 0.0,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 15,
              ),
              child: CircleAvatar(
                child: Image.asset('assets/images/profile_icon.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
