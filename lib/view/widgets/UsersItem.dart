import 'package:flutter/material.dart';
import 'package:smart_mp/utils/AppColors.dart';
import 'package:smart_mp/utils/AppString.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/respons/MemberModel.dart';
import '../../../utils/AppImages.dart';

class UsersItem extends StatelessWidget {
  MemberModel memberModel;
  UsersItem(this.memberModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
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
            bottom: 55,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Name: ',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 5,),
                          Text('${memberModel.name}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        ],
                      ),
                      Row(
                        children: [
                          Text('Designation: ',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 5,),
                          Text('${memberModel.designationParty != null ? memberModel.designationParty!.name : ''}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        ],
                      ),
                      Row(
                        children: [
                          Text('Mobile: ',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 5,),
                          Text('${memberModel.mobileNumber}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        ],
                      ),
                      Row(
                        children: [
                          Text('Union: ',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 5,),
                          Text('${memberModel.union!.name}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        ],
                      ),
                      Row(
                        children: [
                          Text('Ward No: ',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 5,),
                          Text('${memberModel.wardNo}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        ],
                      ),
                      Row(
                        children: [
                          Text('NID : ',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 5,),
                          Text('${memberModel.nid}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        ],
                      ),
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
                          '${AppString.IMAGE_URL}${memberModel.profileImage}',
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

          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
              children: [
                SizedBox(height: 10,),

                Container(
                  height:40,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _launchDialer(memberModel.mobileNumber!);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                              border: Border.all(
                                color: Colors.green, // Change to your desired border color
                                width: 1.0, // Change to your desired border width
                              ),
                            ),
                            padding: EdgeInsets.all(8.0), // Adjust the padding as needed
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(AppImages.ic_call),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  AppString.call,
                                  style: TextStyle(
                                    color: AppColors.text_black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  maxLines: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _launchMessagingApp(memberModel.mobileNumber!);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                              border: Border.all(
                                color: Colors.green, // Change to your desired border color
                                width: 1.0, // Change to your desired border width
                              ),
                            ),
                            padding: EdgeInsets.all(8.0), // Adjust the padding as needed
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(AppImages.ic_message),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  AppString.Message,
                                  style: TextStyle(
                                    color: AppColors.text_black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  maxLines: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            await launch(
                                "https://wa.me/+88${memberModel.mobileNumber!}?text=Hello");
                           // _launchMailApp(memberModel.email!);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                              border: Border.all(
                                color: Colors.green, // Change to your desired border color
                                width: 1.0, // Change to your desired border width
                              ),
                            ),
                            padding: EdgeInsets.all(8.0), // Adjust the padding as needed
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(AppImages.ic_whatsapp),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  AppString.Whats_app,
                                  style: TextStyle(
                                    color: AppColors.text_black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  maxLines: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                )
            ],
          ))

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
