import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_mp/controllers/UnitsController.dart';
import 'package:smart_mp/utils/AppString.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../home_page/home_page_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var utilsController =Get.put(UtilsController());



  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('আপডেট উপলব্ধ'),
          content: Text(
            'স্মার্ট বাগমারা মোবাইল অ্যাপ-এর নতুন আপডেট এখন প্রস্তুত। এই আপডেটের মধ্যে রয়েছে বাগ ফিক্স, পারফরম্যান্সের উন্নতি এবং নতুন বৈশিষ্ট্য সম্পন্ন ফিচার যা ব্যবহারকারীদেরকে এক নতুন অভিজ্ঞতায় নিয়ে যাবে।',
          ),
          actions: [
            TextButton(
              onPressed: () {
                String url = 'https://play.google.com/store/apps/details?id=com.smartmp.bagmaraleague';
                _launchURL(url);
               // Navigator.of(context).pop();
              },
              child: Text('এখনই আপডেট করুন'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('পরে মন্তব্য দিন'),
            ),
          ],
        );
      },
    );
  }


  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionName = packageInfo.version;
    return versionName;
  }

  @override
  Widget build(BuildContext context) {

    // Future.delayed(Duration(seconds: 1), () async {
    //   Get.off(HomePage());
    // });

    utilsController.fetchSettings().then((value) async {
      String version = await getAppVersion();
      print('Version Name: $version');
      if(value != version){
        _showUpdateDialog(context);
      }else{
        utilsController.openApp().then((value) {
          if(utilsController.openAppValue.value == true) {
            Get.off(HomePage());
          }
        });
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
