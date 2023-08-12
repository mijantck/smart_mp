import 'package:flutter/material.dart';
import 'package:smart_mp/utils/AppImages.dart';
import 'package:smart_mp/view/chat_tab/chat_tab_screen.dart';
import 'package:smart_mp/view/home_tab/home_tab_screen.dart';
import 'package:smart_mp/view/more_tab/more_tab_screen.dart';
import 'package:smart_mp/view/settings_tab/settings_tab_screen.dart';

import '../login_regi/login_screen.dart';
import '../profile_tab/profile_tab_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; // Keep track of the current selected tab index

  // final List<Widget> _pages = [
  //   const SettingsTabScreen(), // Replace this with your actual widgets for different tabs
  //   const MoreTabScreen(),
  //   const HomeTabScreen(),
  //   const ChatTabScreen(),
  //    LoginScreen()
  //   //const ProfileTabScreen()
  // ];

  final List<Widget> _pages = [
    const ChatTabScreen(),
    const HomeTabScreen(),
     LoginScreen()
    //const ProfileTabScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex], // Display the selected tab's content
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            // Change the tab when a new item is tapped
            setState(() {
              _currentIndex = index;
            });
          },
          items:  [
            BottomNavigationBarItem(
              icon: Container(
                  height: 30,
                  child: Image.asset(AppImages.ic_chat)),
              label: 'chat',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  height: 30,
                  child: Image.asset(AppImages.ic_home)),
              label: 'Profile',
            ),

            BottomNavigationBarItem(
              icon: Container(
                  height: 30,
                  child: Image.asset(AppImages.ic_profile)),
              label: 'Profile',
            ),

            // BottomNavigationBarItem(
            //   icon: Container(
            //       height: 30,
            //       child: Image.asset(AppImages.ic_more)),
            //   label: 'Search',
            // ),
            // BottomNavigationBarItem(
            //   icon: Container(
            //       height: 30,
            //       child: Image.asset(AppImages.ic_settings)),
            //   label: 'settings',
            // ),


          ],
        ),
      ),
    );
  }
}
