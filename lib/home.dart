import 'package:flutter/material.dart';
import 'package:project_app/coba.dart';
import 'package:project_app/dashboard.dart';
import 'package:project_app/profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_app/cart_page.dart';
import 'package:project_app/chatpage.dart';
import 'package:project_app/resources/color.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedIndex = 0;
  static TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static List<Widget> _widgetOptions = <Widget>[
    Center(
      child: dashboardPage(),
    ),
    Center(
      child: cartPage(),
    ),
    Center(
      child: chatPage(),
    ),
    Center(
      child: profilePage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: secondaryColor,
              hoverColor: secondaryColor,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: secondaryColor,
              color: primaryColor,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  iconActiveColor: primaryColor,
                  textColor: primaryColor,
                ),
                GButton(
                  icon: LineIcons.shoppingCart,
                  iconActiveColor: primaryColor,
                  textStyle: TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                  textColor: primaryColor,
                ),
                GButton(
                  icon: Icons.chat_bubble_outline_rounded,
                  iconActiveColor: primaryColor,
                  textColor: primaryColor,
                ),
                GButton(
                  icon: LineIcons.user,
                  iconActiveColor: primaryColor,
                  textColor: primaryColor,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
