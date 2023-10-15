import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/utils/AppString.dart';

import '../../controllers/UnitsController.dart';
import '../../models/respons/AdminLoginModel.dart';
import '../../models/respons/UserModel.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../home_page/home_page_screen.dart';
import '../login_regi/UserProfileUpdateScreen.dart';

class AdminProfileScreen extends StatefulWidget {
  AdminModel user;
  bool isFromLogin;
  AdminProfileScreen(this.user,{this.isFromLogin = false});

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {

  var utilsController = Get.put(UtilsController());


  Future<bool> _onBackPressed() async {
   print('backkkkkkk');
   utilsController.tabPossition = 0;

   // if(widget.isFromLogin){
   //   Get.offAll(HomePage());
   // }else{
   //   Get.offAll(HomePage());
   // }
    return true;
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
          child: Scaffold(

            body: GetBuilder<UtilsController>(
                builder: (controller) {
                  return Container(
                    margin: EdgeInsets.only(left: 10,right: 10,top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // InkWell(
                            //   onTap: (){
                            //     _onBackPressed();
                            //    // Get.offAll(HomePage());
                            //   },
                            //   child: Container(
                            //     height: 30,
                            //     width: 30,
                            //     child: Image.asset(AppImages.ic_back_button),
                            //   ),
                            // ),

                            Expanded(child: Container(
                              width:MediaQuery.of(context).size.width,
                              child: Center(child: Text('Profile        ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColors.text_black),)),
                            )),
                            // InkWell(
                            //   onTap: (){
                            //
                            //    // Get.to(UserProfileUpdateScreen(widget.user));
                            //   },
                            //   child: Container(
                            //     height: 30,
                            //     width: 30,
                            //     child: Icon(Icons.edit),
                            //     // child: Image.asset(AppImages.ic_back_button),
                            //   ),
                            // ),

                          ],
                        ),
                        SizedBox(height: 10,),

                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                width: double.infinity,
                                child: Image.network(
                                  '${AppString.IMAGE_URL}${widget.user.imageUrl}',
                                  errorBuilder: (context, error, stackTrace) {
                                    // Return a default image when the network image fails to load
                                    return Image.asset(AppImages.plaseholder_image); // Replace 'assets/default_image.png' with your default image asset path
                                  },

                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.user.userName!,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 8),
                                  _buildInfoText('Mobile Number', widget.user.phone == null? '':widget.user.phone!),
                                  _buildInfoText('Email', widget.user.email == null? '':widget.user.email!),
                                  _buildInfoText('Rolue', widget.user.userRole == null? '':widget.user.userRole!),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
      ),
    ) ;
  }


  Widget _buildInfoText(String label, String value) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
              child: Text('$label :', style: TextStyle(fontSize: 14,color: Colors.grey),)),
          Expanded(
              flex: 7,
              child: Text(' $value', style: TextStyle(fontSize: 18,color: Colors.black),)),
        ],
      ),
    );
  }

}
