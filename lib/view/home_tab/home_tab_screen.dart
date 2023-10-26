import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import '../../controllers/UserController.dart';
import '../Citizen/CitizenScreen.dart';
import '../ElectionCommittee/ElectionCommitteeScreen.dart';
import '../MpEventScreens/MpEventListScreen.dart';
import '../PollingAgent/PollingAgentScreen.dart';
import '../VillageCommittee/VillageCommitteeScreen.dart';
import '../Volunteers/VolunteerScreen.dart';
import '../VoterList/VoterListScreen.dart';
import '../bagmara_aboutScreen/BagmaraAboutScreen.dart';
import '../e_sebah_screen/EshebaScreen.dart';
import '../election_commitions/CoordinatorsScreen.dart';
import '../election_commitions/ElectionCommitionsScreen.dart';
import '../login_regi/ForgetPassword/SendSmsScreen.dart';
import '../notifications_screen/NotificationScreen.dart';
import '../party_all/party_all_screen.dart';
import '../profile/profile_screen.dart';
import '../qrcodeScreen/QRViewExample.dart';
import '../social_links/HelpCenterLinkScreen.dart';
import '../social_links/SocialLinkScreen.dart';


class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var utilsController = Get.put(UtilsController());
  var usersListController = Get.put(UserController());
  SharedPreferences? prefs;

  @override
  void initState(){
    _initializeAsyncData();
    super.initState();
  }

  _initializeAsyncData() async {
    prefs = await SharedPreferences.getInstance();
    utilsController.updateToken();
    // Now you can use prefs here or perform any other async initialization tasks
  }

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
                utilsController.changePossition(0);
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
            ListTile(
              title: Text('Change_Password'.tr),
              onTap: () async{
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();

                String? userLoginType =  prefs!.getString(AppString.userLoginType);
                if(userLoginType == null){
                  Fluttertoast.showToast(
                    msg: 'You Are noy login',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 12.0,
                  );
                  return;
                }

                if(userLoginType == AppString.admin){
                  Fluttertoast.showToast(
                    msg: 'Contract with Admin',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 12.0,
                  );
                  return;
                }
                String? mobileNumber =  prefs!.getString(AppString.loginMobile);
                Get.to(SendSmsScreen(mobileNumber: mobileNumber!,));
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
              onTap: () async{
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
                if(utilsController.tokens == null){
                  Get.to(LoginScreen());
                }else{
                  if(usersListController.userModel != null){
                    if(usersListController.userRoles.contains(AppString.citizenTag)){
                      Get.to(CitizenScreen());
                    }else{
                      utilsController.showToast('You are not'+AppString.Citizen);
                    }
                  }else{
                    Get.to(CitizenScreen());
                  }

                }

              },
            ),
            ListTile(
              title: Text(AppString.Volunteer),
              onTap: () async{
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
                if(utilsController.tokens == null){
                  Get.to(LoginScreen());
                }else{
                  if(usersListController.userModel != null){
                    if(usersListController.userRoles.contains(AppString.volunteerTag)){
                      Get.to(VolunteerScreen());
                    }else{
                      utilsController.showToast('You are not'+AppString.Volunteer);
                    }
                  }else{
                    Get.to(VolunteerScreen());
                  }

                }
              },
            ),
            ListTile(
              title: Text(AppString.Polling_agent),
              onTap: () async{
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
                if(utilsController.tokens == null){
                  Get.to(LoginScreen());
                }else{
                  if(usersListController.userModel != null){
                    if(usersListController.userRoles.contains(AppString.polling_agentTag)){
                      Get.to(PollingAgentScreen());
                    }else{
                      utilsController.showToast('You are not Polling Agent');
                    }
                  }else{
                    Get.to(PollingAgentScreen());
                  }

                }
              },
            ),
            ListTile(
              title: Text(AppString.Election_Committee),
              onTap: ()async {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
                if(utilsController.tokens == null){
                  Get.to(LoginScreen());
                }else{
                  if(usersListController.userModel != null){
                    if(usersListController.userRoles.contains(AppString.election_commissionTag)){
                      Get.to(ElectionCommitteeScreen());
                    }else{
                      utilsController.showToast('You are not Vote center Committee');
                    }
                  }else{
                    Get.to(ElectionCommitteeScreen());
                  }
                }
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
              title: Text('ওয়েবসাইট দেখুন'),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
                _launchURL('https://enamulhaquemp.com/');
              },
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
                            _scaffoldKey.currentState?.closeDrawer();
                            // Exit the app
                            // SystemNavigator.pop(); // This will close the app
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
                          child: Text("Logout"),
                          onPressed: () async{
                            // Close the dialog
                            utilsController.logut();

                            utilsController.loginDone(true);
                            utilsController.updateToken();
                            Navigator.pop(context);
                            _scaffoldKey.currentState?.closeDrawer();
                            // Exit the app
                            //SystemNavigator.pop(); // This will close the app
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
                child: GetBuilder<UtilsController>(
                        builder: (utilsController) {
                          return  Column(
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


                                        UnitItemCard(AppImages.election_committee, AppString.Voting_Center_Committee, ()async {

                                          if(utilsController.tokens == null){
                                            Get.to(LoginScreen());
                                          }else{
                                            if(usersListController.userModel != null){
                                              if(usersListController.userRoles.contains(AppString.election_commissionTag)){
                                                Get.to(ElectionCommitteeScreen());
                                              }else{
                                                utilsController.showToast(AppString.not_permitted);
                                              }
                                            }else{
                                              utilsController.showToast(AppString.not_permitted);
                                              //Get.to(ElectionCommitteeScreen());
                                            }

                                          }

                                        }),




                                      ],
                                    ),

                                    Row(
                                      children: [
                                        UnitItemCard(AppImages.ic_citizen, AppString.Citizen, () async{
                                          if(utilsController.tokens == null){
                                            Get.to(LoginScreen());
                                          }else{
                                            if(usersListController.userModel != null){
                                              if(usersListController.userRoles.contains(AppString.citizenTag)){
                                                Get.to(CitizenScreen());
                                              }else{
                                                utilsController.showToast(AppString.not_permitted);
                                              }
                                            }else{
                                              utilsController.showToast(AppString.not_permitted);
                                            }
                                          }
                                        }),
                                        UnitItemCard(AppImages.ic_volunteer, AppString.Volunteer, ()async{

                                          if(utilsController.tokens == null){
                                            Get.to(LoginScreen());
                                          }else{
                                            if(usersListController.userModel != null){
                                              if(usersListController.userRoles.contains(AppString.volunteerTag)){
                                                Get.to(VolunteerScreen());
                                              }else{
                                                utilsController.showToast(AppString.not_permitted);
                                              }
                                            }else{
                                              utilsController.showToast(AppString.not_permitted);
                                            }
                                          }
                                        }),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        UnitItemCard(AppImages.ic_voter_list_eneration, AppString.bagmaraVoterTalika, () {
                                          Get.to(VoterListScreen());

                                        }),

                                        UnitItemCard(AppImages.polling_agent, AppString.Polling_agent, () async{

                                          if(utilsController.tokens == null){
                                            Get.to(LoginScreen());
                                          }else{
                                            if(usersListController.userModel != null){
                                              if(usersListController.userRoles.contains(AppString.polling_agentTag)){
                                                Get.to(PollingAgentScreen());
                                              }else{
                                                utilsController.showToast(AppString.not_permitted);
                                              }
                                            }else{
                                              utilsController.showToast(AppString.not_permitted);
                                            }

                                          }

                                        }),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        UnitItemCard(AppImages.gram_gommitte, AppString.Village_committee, ()async {


                                          if(utilsController.tokens == null){
                                            Get.to(LoginScreen());
                                          }else{
                                            if(usersListController.userModel != null){
                                              if(usersListController.userRoles.contains(AppString.village_communityTag)){
                                                Get.to(VolunteerScreen());
                                              }else{
                                                utilsController.showToast('You are not ${AppString.Village_committee}');
                                              }
                                            }else{
                                              Get.to(VolunteerScreen());
                                            }
                                          }
                                        }),
                                        UnitItemCard(AppImages.mp_event, AppString.MP_Event, () {
                                          Get.to(MpEventListScreen());
                                        }),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        UnitItemCard(AppImages.election_committee, AppString.Election_Committee, () async{

                                          if(utilsController.tokens == null){
                                            Get.to(LoginScreen());
                                          }else{
                                            //Get.to(ElectionCommitteeScreen());
                                            if(utilsController.tokens == AppString.admin){
                                              if(usersListController.adminLoginModel!.user!.userRole == 'election_committes' ){
                                                Get.to(ElectionCommissionsScreen());
                                              }else{
                                                utilsController.showToast(AppString.not_permitted);
                                              }
                                            }else{
                                              utilsController.showToast(AppString.not_permitted);
                                            }
                                          }

                                        }),

                                        UnitItemCard(AppImages.ic_coordinator, 'Coordinator'.tr, () async{

                                          if(utilsController.tokens == null){
                                            Get.to(LoginScreen());
                                          }else{
                                            if(utilsController.tokens == AppString.admin){
                                              if(usersListController.adminLoginModel!.user!.userRole == 'coordinator' ){
                                                Get.to(CoordinatorsScreen());
                                              }else{
                                                utilsController.showToast(AppString.not_permitted);
                                              }
                                            }else{
                                              utilsController.showToast(AppString.not_permitted);
                                            }
                                            //Get.to(ElectionCommitteeScreen());

                                          }

                                        }),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        UnitItemCard(AppImages.ic_news, AppString.News, () {
                                          Get.to(AllNewsScreen());
                                        }),
                                        UnitItemCard(AppImages.ic_service, AppString.E_sheba, () {
                                          Get.to(EshebaScreen());
                                        }),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        UnitItemCard(AppImages.ic_social_media, AppString.social_link, () {
                                          Get.to(SocialLinksScreens());

                                        }),
                                        UnitItemCard(AppImages.ic_suporrt, AppString.help_center, (){
                                          Get.to(HelpCenterLinkScreen());

                                          //_launchDialer('1111111111');
                                        }),
                                      ],
                                    ),



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
                          );
                        })



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
  void _launchDialer(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunch(phoneLaunchUri.toString())) {
      await launch(phoneLaunchUri.toString());
    } else {
      print('Could not launch dialer.');
    }
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

}
