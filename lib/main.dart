import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/utils/AppString.dart';
import 'package:smart_mp/view/splase_screens/splash_screen.dart';

import 'controllers/MemberController.dart';
import 'controllers/NewsController.dart';
import 'controllers/SliderController.dart';
import 'controllers/UnitsController.dart';
import 'controllers/UserController.dart';

void main() {

  Get.put(SliderController());
  Get.put(UtilsController());
  Get.put(UserController());
  Get.put(MemberController());
  Get.put(NewsController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.APP_NAME,
      home: SplashScreen(),
    );
  }
}

