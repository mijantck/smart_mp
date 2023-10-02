import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_mp/utils/AppImages.dart';
import 'package:smart_mp/view/chat_tab/chat_tab_screen.dart';
import 'package:smart_mp/view/home_tab/home_tab_screen.dart';
import 'package:smart_mp/view/more_tab/more_tab_screen.dart';
import 'package:smart_mp/view/profile/admin_profile_screen.dart';
import 'package:smart_mp/view/settings_tab/settings_tab_screen.dart';
import 'package:device_info/device_info.dart';
import '../../controllers/UnitsController.dart';
import '../../controllers/UserController.dart';
import '../../utils/AppString.dart';
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

  late PersistentTabController _controller;


  // Define your initial pages here
  final List<Widget> _initialPages =  [
    HomeTabScreen(),
    QRViewExample(),
    LoginScreen(),
  ];

  // Later, you can set this to the actual pages based on user login status
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _getFCMToken();
    _setupPages();
  }

  Future<void> _setupPages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null ||  token == '') {
      setState(() {
        _pages = _initialPages;
      });
    } else {


      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.getString(AppString.token) != null ){
        var userController = Get.put(UserController());
        if(prefs.getString(AppString.userLoginType) == AppString.admin ){
          String? email = prefs.getString(AppString.loginEmail);
          String? pass = prefs.getString(AppString.loginPassword);
          print('shjskd ${email} ${pass}');
          userController.loginUserAdmin(email!, pass!).then((value) {
            if(!value.isSuccess){
              prefs.setString(AppString.token, '');
              prefs.setString(AppString.role, '');
              prefs.setString(AppString.userLoginType, '');
              prefs.setString(AppString.loginEmail, '');
              prefs.setString(AppString.loginPassword, '');
              prefs.setString(AppString.loginMobile, '');
            }else{
              setState(() {
                _pages = [
                  const HomeTabScreen(),
                  QRViewExample(),
                  AdminProfileScreen(userController.adminLoginModel!.user!),
                ];
              });
            }
          });
        }else if(prefs.getString(AppString.userLoginType) == AppString.general){
          String? mobile = prefs.getString(AppString.loginMobile);
          String? pass = prefs.getString(AppString.loginPassword);
          userController.loginUser(mobile!, pass!).then((value) {
            if(!value.isSuccess){
              prefs.setString(AppString.token, '');
              prefs.setString(AppString.role, '');
              prefs.setString(AppString.userLoginType, '');
              prefs.setString(AppString.loginEmail, '');
              prefs.setString(AppString.loginPassword, '');
              prefs.setString(AppString.loginMobile, '');
            }else{
              setState(() {
                _pages = [
                  const HomeTabScreen(),
                  QRViewExample(),
                  ProfileScreen(userController.userModel!.user!),
                ];
              });
            }
          });
        }else{
          prefs.setString(AppString.token, '');
          prefs.setString(AppString.role, '');
          prefs.setString(AppString.userLoginType, '');
          prefs.setString(AppString.loginEmail, '');
          prefs.setString(AppString.loginPassword, '');
          prefs.setString(AppString.loginMobile, '');
          setState(() {
            _pages = _initialPages;
          });
        }
      }else{
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

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: 'Home'.tr,
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          width: 50.0, // Adjust as needed
          height: 50.0, // Adjust as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle, // This makes the container circular
            color: Colors.white, // Set the background color
          ),
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
        title: "QR Code".tr,
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: 'Profile'.tr,
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<UtilsController>(
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
            return PersistentTabView(
              context,
              controller: _controller,
              screens: _pages,
              items: _navBarsItems(),
              confineInSafeArea: true,
              backgroundColor: Colors.white, // Default is Colors.white.
              handleAndroidBackButtonPress: true, // Default is true.
              resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
              stateManagement: true, // Default is true.
              hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
              decoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(10.0),
                colorBehindNavBar: Colors.white,
              ),
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
            );
          }
        })
    );
  }
}
