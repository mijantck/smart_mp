import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/controllers/NewsController.dart';
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

import '../../controllers/SliderController.dart';
import '../MpEventScreens/MpEventListScreen.dart';
import '../e_sebah_screen/EshebaScreen.dart';
import '../party_all/party_all_screen.dart';
import '../profile/profile_screen.dart';


class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
              title: Text('Home'),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title: Text('Chat'),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title: Text(AppString.Bagmara_League),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title: Text(AppString.Citizen),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title: Text(AppString.Volunteer),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
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
              },
            ),
            ListTile(
              title: Text(AppString.MP_Event),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title: Text(AppString.News),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title: Text(AppString.Smart_Bagmara),
              onTap: () {
                // Handle drawer item tap
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            ListTile(
              title: Text('Log out'),
              onTap: () {
                _scaffoldKey.currentState?.closeDrawer();
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
                    child: Container(
                        height: 40,
                        width: 40,
                        child: Image.asset(AppImages.ic_notification)))
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
                              UnitItemCard(AppImages.ic_awamilig, AppString.Bagmara_League, () => {
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
                              UnitItemCard(AppImages.ic_awamilig, AppString.Polling_agent, () => null),
                              //

                            ],
                          ),
                          Row(
                            children: [
                              UnitItemCard(AppImages.ic_awamilig, AppString.Election_Committee, () => null),
                              //UnitItemCard(AppImages.ic_about, AppString.About, () => null),
                              UnitItemCard(AppImages.ic_awamilig, AppString.Ena_Campaign_Committee, () => null),
                              //UnitItemCard(AppImages.ic_scanner, AppString.Scanner, () => null),

                              // UnitItemCard(AppImages.ic_mosque, AppString.PrayerTime, () => null),
                            ],
                          ),
                          Row(
                            children: [
                              UnitItemCard(AppImages.ic_awamilig, AppString.Village_committee, () => null),
                              UnitItemCard(AppImages.ic_service, AppString.E_sheba, () {
                                Get.to(EshebaScreen());
                              }),
                              // UnitItemCard(AppImages.ic_mp_event, AppString.mp_event, () => null),
                            ],
                          ),
                          Row(
                            children: [
                              UnitItemCard(AppImages.ic_awamilig, AppString.MP_Event, () {
                                Get.to(MpEventListScreen());
                              }),
                              UnitItemCard(AppImages.ic_news, AppString.News, () {
                                Get.to(AllNewsScreen());
                              }),
                              // UnitItemCard(AppImages.ic_mp_event, AppString.mp_event, () => null),
                            ],
                          ),
                          Row(
                            children: [
                              UnitItemCard(AppImages.ic_scanner, AppString.Scanner, () => null),
                              UnitItemCard(AppImages.ic_scanner, AppString.Smart_Bagmara, () => null),
                              // UnitItemCard(AppImages.ic_mp_event, AppString.mp_event, () => null),
                            ],
                          ),
                          // News
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text('News',style: TextStyle(color: AppColors.text_black,fontWeight: FontWeight.bold,fontSize: 18),),
                              Expanded(child: Container()),
                              InkWell(
                                  onTap: (){
                                    Get.to(AllNewsScreen());
                                  },
                                  child: Text('View All',style: TextStyle(color: AppColors.gray,fontWeight: FontWeight.normal,fontSize: 15),)),

                            ],
                          ),
                          GetBuilder<NewsController>(
                            builder: (controller) {
                              if (controller.newsList == null) {
                                // Show a loading indicator while data is being fetched
                                return Center(child: CircularProgressIndicator());
                              } else {
                                return SizedBox(
                                  height: controller.newsList!.length * 210,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.newsList!.length,
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


}
