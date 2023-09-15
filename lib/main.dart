import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/utils/AppString.dart';
import 'package:smart_mp/utils/LocaleString.dart';
import 'package:smart_mp/view/splase_screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controllers/MemberController.dart';
import 'controllers/NewsController.dart';
import 'controllers/SliderController.dart';
import 'controllers/UnitsController.dart';
import 'controllers/UserController.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


FirebaseMessaging messaging = FirebaseMessaging.instance;

void handleFCMNotifications() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Message received when the app is in the foreground: ${message.data}');
    // Handle the notification here when the app is in the foreground.
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('Message opened from the background: ${message.data}');
    // Handle the notification here when the app is opened from the background.
  });



}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      locale: Locale('bn', 'BD'),
      // Provide the LocaleString class as a translations delegate
      translations: LocaleString(),
      title: 'Smart Bagmara'.tr,
      home: SplashScreen(),
    );
  }
}

