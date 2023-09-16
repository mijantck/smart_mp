import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_mp/controllers/NewsController.dart';
import 'package:smart_mp/controllers/UnitsController.dart';
import 'package:smart_mp/models/respons/NewModel.dart';
import 'package:smart_mp/utils/AppColors.dart';
import 'package:smart_mp/utils/AppImages.dart';
import 'package:smart_mp/utils/AppString.dart';
import 'package:smart_mp/view/all_news/AllNewsScreen.dart';
import 'package:smart_mp/view/home_tab/widgets/auto_scroll_slider.dart';
import 'package:smart_mp/view/home_tab/widgets/item_card.dart';
import 'package:smart_mp/view/home_tab/widgets/news_item.dart';
import 'package:smart_mp/view/home_tab/widgets/unit_item_card.dart';
import 'package:smart_mp/view/login_regi/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/SliderController.dart';
import '../MpEventScreens/MpEventListScreen.dart';
import '../bagmara_aboutScreen/BagmaraAboutScreen.dart';
import '../e_sebah_screen/EshebaScreen.dart';
import '../notifications_screen/NotificationScreen.dart';
import '../party_all/party_all_screen.dart';
import '../profile/profile_screen.dart';
import '../qrcodeScreen/QRViewExample.dart';


class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var utilsController = Get.put(UtilsController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        // Add your navigation drawer content here
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset(AppImages.bg_home_top,fit: BoxFit.cover,),
            ),
            ListTile(
              title: Text('Home'.tr),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
                utilsController.changePossition(1);
              },
            ),

            ListTile(
              title: Text('Profile'.tr),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
                utilsController.changePossition(2);
              },
            ),
            Container(
              margin: EdgeInsets.only(left: 4,right: 5),
              color: AppColors.gray_text,
              width: MediaQuery.of(context).size.width,
              height: 1,
            ),
            // ListTile(
            //   title: Text('Change Language'),
            //   onTap: () {
            //     _showLanguageDialog();
            //   },
            // ),
            ListTile(
              title: Text('Bagmara_League'.tr),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
                Get.to(PartyAll());

              },
            ),
            ListTile(
              title: Text('Citizen'.tr),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
                Get.to(LoginScreen());
              },
            ),
            ListTile(
              title: Text(AppString.Volunteer),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
                Get.to(LoginScreen());
              },
            ),
            ListTile(
              title: Text(AppString.Polling_agent),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title: Text(AppString.Election_Committee),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title: Text(AppString.E_sheba),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();

                Get.to(EshebaScreen());
              },
            ),
            ListTile(
              title: Text(AppString.MP_Event),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();

                Get.to(MpEventListScreen());
              },
            ),
            ListTile(
              title: Text(AppString.News),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
                Get.to(AllNewsScreen());
              },
            ),
            ListTile(
              title: Text(AppString.Smart_Bagmara),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),

            Container(
              margin: EdgeInsets.only(left: 4,right: 5),
              color: AppColors.gray_text,
              width: MediaQuery.of(context).size.width,
              height: 1,
            ),
            ListTile(
              title: Text(AppString.Privacy_policy),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
                _launchURL(AppString.Privacy_policy_url);
              },
            ),

            ListTile(
              title: Text(AppString.terms_and_conditions),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
                _launchURL(AppString.terms_and_conditions_url);

              },
            ),

            ListTile(
              title: Text(AppString.delete_my_account),
              onTap: () {
                // Show a confirmation dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm Deletion"),
                      content: Text("Are you sure you want to delete your account? we delete your account with in 15 days"),
                      actions: [
                        TextButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                        ),
                        TextButton(
                          child: Text("Delete"),
                          onPressed: () {
                            // Close the dialog
                            Navigator.pop(context);
                            // Exit the app
                            SystemNavigator.pop(); // This will close the app
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),


            ListTile(
              title: Text(AppString.Logout),
              onTap: () {
                // Show a confirmation dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm Logout"),
                      content: Text("Are you sure you want to Logout your account?"),
                      actions: [
                        TextButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                        ),
                        TextButton(
                          child: Text("Delete"),
                          onPressed: () {
                            // Close the dialog
                            Navigator.pop(context);
                            // Exit the app
                            SystemNavigator.pop(); // This will close the app
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),

          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 170,
            width: MediaQuery.of(context).size.width,
            color: AppColors.home_bg,
            child: Stack(
              children: [
                Positioned(
                    child: Column(
                      children: [
                        Container(
                           width: MediaQuery.of(context).size.width,
                            height: 170,
                            child: Image.asset(AppImages.bg_home_top,fit: BoxFit.cover,)),
                      ],
                    )),
                Positioned(
                    top: 20,
                    left: 20,
                    child: InkWell(
                      onTap: (){
                        print('dfhjsdfhdj');
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          child: Image.asset(AppImages.ic_menu)),
                    )),

                Positioned(
                    top: 20,
                    right: 20,
                    child: InkWell(
                      onTap: (){
                        Get.to(NotificationScreen());

                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          child: Image.asset(AppImages.ic_notification)),
                    ))
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(

                child: Column(
                  children: [
                    Container(
                      height: 180,
                      child: Center(
                        child: GetBuilder<SliderController>(
                          builder: (controller) {

                            if (controller.sliders.value.isEmpty) {
                              print('hgjsg 111');
                              return CircularProgressIndicator();
                            } else {
                              print('hgjsg 222');
                              return AutoSliderScreen(sliders: controller.sliders.value);
                            }
                          },
                        ),
                      ),
                    ),
                    //Card options
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              UnitItemCard(AppImages.ic_awamilig, 'Bagmara_League'.tr, () => {
                                Get.to(PartyAll())
                              }),
                              UnitItemCard(AppImages.ic_citizen, AppString.Citizen, () {
                                Get.to(LoginScreen());

                              }),

                            ],
                          ),
                          Row(
                            children: [
                              UnitItemCard(AppImages.ic_volunteer, AppString.Volunteer, (){
                                Get.to(LoginScreen());
                              }),
                              UnitItemCard(AppImages.polling_agent, AppString.Polling_agent, () {
                                Get.to(LoginScreen());
                              }),
                              //

                            ],
                          ),
                          Row(
                            children: [
                              UnitItemCard(AppImages.election_committee, AppString.Election_Committee, (){
                                Get.to(LoginScreen());
                                
                              }),
                              //UnitItemCard(AppImages.ic_about, AppString.About, () => null),
                              UnitItemCard(AppImages.mp_event, AppString.MP_Event, () {
                                Get.to(MpEventListScreen());
                              }),
                            ],
                          ),
                          Row(
                            children: [
                              UnitItemCard(AppImages.gram_gommitte, AppString.Village_committee, () {
                                Get.to(LoginScreen());
                              }),
                              UnitItemCard(AppImages.ic_service, AppString.E_sheba, () {
                                Get.to(EshebaScreen());
                              }),
                              // UnitItemCard(AppImages.ic_mp_event, AppString.mp_event, () => null),
                            ],
                          ),
                          Row(
                            children: [

                              UnitItemCard(AppImages.ic_news, AppString.News, () {
                                Get.to(AllNewsScreen());
                              }),
                              UnitItemCard(AppImages.home_logo, AppString.Smart_Bagmara, () {
                                Get.to(BagmaraAboutScreen());
                              }),
                            ],
                          ),
                          Row(
                            children: [
                              // UnitItemCard(AppImages.ic_scanner, AppString.Scanner, (){
                              //
                              //
                              // }),

                              // UnitItemCard(AppImages.ic_mp_event, AppString.mp_event, () => null),
                            ],
                          ),
                          // News
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text(AppString.News,style: TextStyle(color: AppColors.text_black,fontWeight: FontWeight.bold,fontSize: 18),),
                              Expanded(child: Container()),
                              InkWell(
                                  onTap: (){
                                    Get.to(AllNewsScreen());
                                  },
                                  child: Text('View All'.tr,style: TextStyle(color: AppColors.gray,fontWeight: FontWeight.normal,fontSize: 15),)),

                            ],
                          ),
                          GetBuilder<NewsController>(
                            builder: (controller) {
                              if (controller.newsList == null) {
                                // Show a loading indicator while data is being fetched
                                return Center(child: CircularProgressIndicator());
                              } else {
                                return SizedBox(
                                  height: 3 * 220,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.newsList!.length > 3 ? 3 : controller.newsList!.length,
                                    itemBuilder: (context, index) {
                                      NewModel n = controller.newsList![index];

                                      return NewsItem(n);
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    )

                  ],
                )

              )
          )
        ],
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('English'),
                onTap: () {
                  // Set the app's locale to English
                  Get.updateLocale(Locale('en', 'US'));
                  Navigator.pop(context); // Close the dialog
                },
              ),
              ListTile(
                title: Text('বাংলা'),
                onTap: () {
                  // Set the app's locale to Bengali
                  Get.updateLocale(Locale('bn', 'BD'));
                  Navigator.pop(context); // Close the dialog
                },
              ),
            ],
          ),
        );
      },
    );
  }


  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

}
