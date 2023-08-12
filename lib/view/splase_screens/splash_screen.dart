import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../home_page/home_page_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the next page (HomePage) after the delay
      Get.off(HomePage()); // You can use Get.to(HomePage()) if you want to push it to the stack instead of replacing the current route.
    });

    return SafeArea(
        child: Scaffold(
          body: Container(
            color: AppColors.splash_bg,
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(AppImages.splash_image,)
                ),
                Positioned(
                    bottom: 150,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      color: AppColors.splash_bg_bannr,
                    )
                ),
                Positioned(
                    bottom: 120,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                              height: 2,
                              width: 10,
                              color: AppColors.splash_bg_Yewalow,
                            ),
                              SizedBox(width: 5,),
                              Container(
                                height: 2,
                                width: 45,
                                color: AppColors.splash_bg_Yewalow,
                              ),
                              SizedBox(width: 5,),
                              Container(
                                height: 2,
                                width: 10,
                                color: AppColors.splash_bg_Yewalow,
                              ),

                          ],),
                          SizedBox(height: 10,),
                          Container(
                            height: 60,
                            width: 60,
                            child: Image.asset(AppImages.ic_splash_go,),
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
        )

    );
  }
}
