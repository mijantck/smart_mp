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

class SocialLinksScreens extends StatefulWidget {
  const SocialLinksScreens({super.key});

  @override
  State<SocialLinksScreens> createState() => _SocialLinksScreensState();
}

class _SocialLinksScreensState extends State<SocialLinksScreens> {

  var utilsController =  Get.put(UtilsController());

  @override
  void initState() {
    utilsController.fetchSocialLink();

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
                      child: Center(child: Text(AppString.social_link,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColors.text_black),)),
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
                              _launchURL(socialLinkModel.url!)

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
}