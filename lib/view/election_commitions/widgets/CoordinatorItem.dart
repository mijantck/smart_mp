import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/models/respons/AdminLoginModel.dart';
import 'package:smart_mp/models/respons/VoterListModel.dart';
import 'package:smart_mp/utils/AppColors.dart';
import 'package:smart_mp/utils/AppString.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/respons/MemberModel.dart';
import '../../../utils/AppImages.dart';

class CoordinatorItem extends StatelessWidget {
  AdminModel adminModelData;
  CoordinatorItem(this.adminModelData);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,

              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 20,
                              child: Text('${AppString.Name}: ',style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(width: 5,),
                            Text('${adminModelData.userName}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                          ],
                        ),
                        SizedBox(height: 3,),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              child: Text(AppString.email,style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(width: 5,),
                            Text('${adminModelData.email}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                          ],
                        ),
                        SizedBox(height: 3,),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              child: Text('${AppString.mobile}: ',style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(width: 5,),
                            Text('${adminModelData.phone}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                          ],
                        ),
                        // SizedBox(height: 3,),
                        // Row(
                        //   children: [
                        //     Container(
                        //       height: 20,
                        //       child: Text('${AppString.Union_all}: ',style: TextStyle(fontWeight: FontWeight.bold)),
                        //     ),
                        //     SizedBox(width: 5,),
                        //     Text('${adminModelData.unions!.name}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        //   ],
                        // ),
                        //
                        // SizedBox(height: 3,),
                        // Row(
                        //   children: [
                        //     Container(
                        //       height: 20,
                        //       child: Text('Coordinator'.tr,style: TextStyle(fontWeight: FontWeight.bold)),
                        //     ),
                        //     SizedBox(width: 5,),
                        //     Text(': ${adminModelData.coordinator == null ? '' :adminModelData.coordinator!.userName}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        //   ],
                        // ),
                        SizedBox(height: 3,),
                        // Row(
                        //   children: [
                        //     Container(
                        //       height: 20,
                        //       child: Text('${AppString.date_of_Birth}: ',style: TextStyle(fontWeight: FontWeight.bold)),
                        //     ),
                        //     SizedBox(width: 5,),
                        //     Text('${adminModelData.dateOfBirth}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        //   ],
                        // ),
                        // SizedBox(height: 3,),
                        // Row(
                        //   children: [
                        //     Container(
                        //       height: 20,
                        //       child: Text('${AppString.address}: ',style: TextStyle(fontWeight: FontWeight.bold)),
                        //     ),
                        //     SizedBox(width: 5,),
                        //     Text('${adminModelData.address}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        //   ],
                        // ),
                        // SizedBox(height: 3,),
                        // Row(
                        //   children: [
                        //     Container(
                        //       height: 20,
                        //       child: Text('${AppString.mobile}: ',style: TextStyle(fontWeight: FontWeight.bold)),
                        //     ),
                        //     SizedBox(width: 5,),
                        //     Text('${adminModelData.mobileNumber}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        //   ],
                        // ),



                      ],
                    ),
                  ),

                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        child: ClipOval(
                          child: Image.network(
                            '${AppString.IMAGE_URL}${adminModelData.imageUrl}',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                AppImages.plaseholder_image, // Replace with the path to your placeholder image
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  )


                ],
              )
          ),

        ],
      ),
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

  // Function to open the email client
  void _launchMailApp(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      print('Could not launch email client.');
    }
  }

  // Function to open the messaging (SMS) app
  void _launchMessagingApp(String phoneNumber) async {
    final Uri messageLaunchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );

    if (await canLaunch(messageLaunchUri.toString())) {
      await launch(messageLaunchUri.toString());
    } else {
      print('Could not launch messaging app.');
    }
  }
}
