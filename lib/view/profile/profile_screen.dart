import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/utils/AppString.dart';

import '../../controllers/UnitsController.dart';
import '../../models/respons/UserModel.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../home_page/home_page_screen.dart';

class ProfileScreen extends StatefulWidget {
  User user;
  ProfileScreen(this.user);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  Future<bool> _onBackPressed() async {
   print('backkkkkkk');
   Get.offAll(HomePage());
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
                            InkWell(
                              onTap: (){
                                Get.offAll(HomePage());
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                child: Image.asset(AppImages.ic_back_button),
                              ),
                            ),

                            Expanded(child: Container(
                              width:MediaQuery.of(context).size.width,
                              child: Center(child: Text('Profile        ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColors.text_black),)),
                            ))
                          ],
                        ),
                        SizedBox(height: 10,),

                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage('${AppString.IMAGE_URL}${widget.user.profileImage}'),
                                  ),
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
                                        widget.user.name!,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 8),
                                  _buildInfoText('Father/Husband', widget.user.fatherHusband == null? '': widget.user.fatherHusband!),
                                  _buildInfoText('Mother', widget.user.mother == null? '':widget.user.mother!),
                                  _buildInfoText('Date of Birth', widget.user.dateOfBirth == null? '':widget.user.dateOfBirth!),
                                  _buildInfoText('Mobile Number', widget.user.mobileNumber == null? '':widget.user.mobileNumber!),
                                  _buildInfoText('Email', widget.user.email == null? '':widget.user.email!),
                                  _buildInfoText('NID', widget.user.nid == null? '':widget.user.nid!),
                                  _buildInfoText('Address', widget.user.address == null? '':widget.user.address!),
                                  _buildInfoText('Gender', widget.user.gender == null? '':widget.user.gender!),

                                  widget.user.role == 'volunteer' ? _buildInfoText('Referred Cone', widget.user.refferCode!):Container(),

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
