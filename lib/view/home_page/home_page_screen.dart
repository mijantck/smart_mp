import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_mp/utils/AppImages.dart';
import 'package:smart_mp/view/chat_tab/chat_tab_screen.dart';
import 'package:smart_mp/view/home_tab/home_tab_screen.dart';
import 'package:smart_mp/view/more_tab/more_tab_screen.dart';
import 'package:smart_mp/view/settings_tab/settings_tab_screen.dart';
import 'package:device_info/device_info.dart';
import '../../controllers/UnitsController.dart';
import '../../controllers/UserController.dart';
import '../login_regi/login_screen.dart';
import '../profile/profile_screen.dart';
import '../profile_tab/profile_tab_screen.dart';
import '../qrcodeScreen/QRViewExample.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Define your initial pages here
  final List<Widget> _initialPages =  [
    HomeTabScreen(),
    LoginScreen(),
  ];

  // Later, you can set this to the actual pages based on user login status
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _getFCMToken();
    _setupPages();
  }

  Future<void> _setupPages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      setState(() {
        _pages = _initialPages;
      });
    } else {
      var userController = Get.put(UserController());
      await userController.getUserToken();

      if (userController.userModel!.user != null) {
        setState(() {
          _pages = [
            const HomeTabScreen(),
            ProfileScreen(userController.userModel!.user!),
          ];
        });
      } else {
        setState(() {
          _pages = _initialPages;
        });
      }
    }
  }



  Future<void> _getFCMToken() async {
    print('FCM Token: 111  ');
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print('FCM Token: $fcmToken');
    var utilsController = Get.put(UtilsController());
    String? fcmTokenS = fcmToken;
    final deviceId = await getDeviceId();

    utilsController.postToken( '${fcmTokenS}', '${deviceId}');

  }

  Future<String?> getDeviceId() async {
    String? deviceId;
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      }
    } catch (e) {
      print('Error getting device ID: $e');
    }

    return deviceId;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  GetBuilder<UtilsController>(
        builder: (controller) {

          if (_pages.length == 0) {
            // Show a loading indicator while data is being fetched
            return Container(

              child: Scaffold(
                body: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 80,
                        right: 80,
                        bottom: 0,
                        child: Image.asset(AppImages.home_logo,)
                    ),
                  ],
                ),
              ),
            );
          }else {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.to(QRViewExample());
                },
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0), // Circular shape
                  ),
                  child: Container(
                    width: 50.0, // Adjust as needed
                    height: 50.0, // Adjust as needed
                    child: Center(
                      child: ClipOval(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Image.asset(
                            AppImages.ic_qr_code,
                            width: 50.0, // Image width
                            height: 50.0, // Image height
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation
                  .centerDocked,
              body: Stack(
                children: [
                  _pages[_currentIndex],
                ],
              ), // Display the selected tab's content
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (int index) {
                  // Change the tab when a new item is tapped
                  setState(() {
                    controller.changePossition(index);
                    _currentIndex = index;
                  });
                },
                items: [

                  BottomNavigationBarItem(
                    icon: Container(
                        height: 30,
                        child: Container(
                            padding: EdgeInsets.all(3),
                            child: Image.asset(AppImages.ic_home))),
                    label: 'Home'.tr,
                  ),

                  BottomNavigationBarItem(
                    icon: Container(
                        height: 30,
                        child: Image.asset(AppImages.ic_profile)),
                    label: 'Profile'.tr,
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
            );
          }
        })
    );
  }
}
