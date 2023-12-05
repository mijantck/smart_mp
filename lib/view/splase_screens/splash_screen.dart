import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import 'package:path_provider/path_provider.dart';

import 'DotLoadingIndicator.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var utilsController = Get.put(UtilsController());
  bool rememberMe = false;
  bool checked = true;


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
                String url =
                    'https://play.google.com/store/apps/details?id=com.smartmp.bagmaraleague';
                _launchURL(url);
                // Navigator.of(context).pop();
              },
              child: Text('এখনই আপডেট করুন'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Get.off(HomePage());
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

  Future<bool?> getChecked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? checks =  prefs.getBool('checked');
    if(checks == null){
      setState(() {
        checked = false;
      });

    }else{
      setState(() {
        checked = checks;
      });
    }

    return checks;
  }

  Future<void> _deleteCacheDir() async {
    var tempDir = await getTemporaryDirectory();

    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  }

  Future<void> _deleteAppDir() async {
    var appDocDir = await getApplicationDocumentsDirectory();

    if (appDocDir.existsSync()) {
      appDocDir.deleteSync(recursive: true);
    }
  }
  @override
  void initState() {
    getChecked().then((value) {
      if (value != null && value) {
        if(checked){
          print('hgjdfg 777');
          gotoHome();
        }else{
          setState(() {
            checked = false;
          });
        }
      }else{
        setState(() {
          checked = false;
        });

      }
    });
    super.initState();
  }


  gotoHome(){
    // Future.delayed(Duration(seconds: 4), () {
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
  }

  @override
  Widget build(BuildContext context) {






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
                child: Image.asset(
                  AppImages.home_logo,
                )),
            Positioned(
                bottom: 30,
                left: 40,
                right: 40,
                child:  checked ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SpinKitThreeBounce(
                            color: Colors.green,
                            size: 40.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ) : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: rememberMe, // Update this with your remember option value
                          onChanged: (value) {
                            setState(() {
                              rememberMe =  !rememberMe;
                            });
                            // Implement the logic to update the remember option here
                          },
                          checkColor: Colors.grey, // Gray check color
                          activeColor: Colors.transparent, // Transparent background
                        ),
                        Text('I agree to the '),
                        GestureDetector(
                          onTap: () {
                            launch('https://appenamulhaquemp.com/public/policy');
                          },
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async{
                        if(!rememberMe){
                          Fluttertoast.showToast(
                            msg:'If you agree then click on checkbox',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 12.0,
                          );
                        }else{
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool('checked', true);
                          setState(() {
                            checked = true;
                            gotoHome();
                          });

                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                        ),
                        child: Center(
                          child: Text(
                            'Start',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
