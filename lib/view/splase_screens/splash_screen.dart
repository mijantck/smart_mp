import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_mp/controllers/UnitsController.dart';
import 'package:smart_mp/utils/AppString.dart';

import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../home_page/home_page_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 4), () async {

      var utilsController =Get.put(UtilsController());
      if(utilsController.openAppValue.value == true) {
        Get.off(HomePage());
      }
    });

    return SafeArea(
        child: Scaffold(
          body: Container(

            child: Stack(
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
        )

    );
  }
}
