import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/UnitsController.dart';
import '../../models/respons/SocialLinkModel.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';
import '../home_tab/widgets/item_card.dart';
import '../home_tab/widgets/social_card.dart';

class HelpCenterLinkScreen extends StatefulWidget {
  const HelpCenterLinkScreen({super.key});

  @override
  State<HelpCenterLinkScreen> createState() => _HelpCenterLinkScreenState();
}

class _HelpCenterLinkScreenState extends State<HelpCenterLinkScreen> {

  var utilsController =  Get.put(UtilsController());

  @override
  void initState() {
    utilsController.fetchAppSupportLink();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Image.asset(AppImages.ic_back_button),
                      ),
                    ),
                    Expanded(child: Container(
                      width:MediaQuery.of(context).size.width,
                      child: Center(child: Text(AppString.help_center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColors.text_black),)),
                    ))
                  ],
                ),

                SizedBox(height: 10,),

                GetBuilder<UtilsController>(
                  builder: (controller) {
                    if (controller.socialLinkModel == null) {
                      // Show a loading indicator while data is being fetched
                      return Center(child: CircularProgressIndicator());
                    } else {

                      return Expanded(
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Change this to the number of items you want to show horizontally
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: controller.socialLinkModel!.length, // Change this to the number of items you want in the grid
                          itemBuilder: (context, index) {
                            // Replace this with the code to build your grid item

                            SocialLinkModel socialLinkModel = controller.socialLinkModel[index];
                            return SocislItemCard(socialLinkModel, () => {
                              if(socialLinkModel.type == 'phone'){
                                _launchDialer(socialLinkModel.value!)
                              }else{
                                _launchURL(socialLinkModel.value!)
                              }

                            });
                          },
                        ),
                      );
                    }
                  },
                ),


              ],
            ),
          )
        )
    );
  }
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
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
}