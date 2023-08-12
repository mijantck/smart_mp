import 'package:flutter/material.dart';
import 'package:smart_mp/utils/AppColors.dart';
import 'package:smart_mp/utils/AppString.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/respons/MemberModel.dart';
import '../../../utils/AppImages.dart';

class MemberItem extends StatelessWidget {
  MemberModel memberModel;
  MemberItem(this.memberModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.gray_withe,
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
                          Container(
                            height: 20,
                            width: 20,
                            child: Image.asset(AppImages.ic_iser_name),
                          ),
                          SizedBox(width: 5,),
                          Text('${memberModel.name}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            child: Image.asset(AppImages.ic_designation),
                          ),
                          SizedBox(width: 5,),
                          Text('${memberModel.designationParty != null ? memberModel.designationParty!.name : ''}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            child: Image.asset(AppImages.ic_mail),
                          ),
                          SizedBox(width: 5,),
                          Text('${memberModel.email}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            child: Image.asset(AppImages.ic_call),
                          ),
                          SizedBox(width: 5,),
                          Text('${memberModel.mobileNumber}',style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Image.network(
                    '${AppString.IMAGE_URL}${memberModel.profileImage}',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // If the image fails to load, display a placeholder image or error message
                      return Image.asset(
                        AppImages.plaseholder_image, // Replace with the path to your placeholder image
                        fit: BoxFit.cover,
                      );
                    },
                  ),
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
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: AppColors.gray_text.withOpacity(.5),
              ),
                Container(
                  height:40,
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                            onTap: (){
                              _launchDialer(memberModel.mobileNumber!);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(AppImages.ic_call),
                                ),
                                SizedBox(width: 5,),
                                Text(AppString.call,style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                              ],
                            ),
                          ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                              _launchMessagingApp(memberModel.mobileNumber!);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                child: Image.asset(AppImages.ic_message),
                              ),
                              SizedBox(width: 5,),
                              Text(AppString.Message,style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            _launchMailApp(memberModel.email!);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                child: Image.asset(AppImages.ic_mail),
                              ),
                              SizedBox(width: 5,),
                              Text(AppString.Mail,style: TextStyle(color: AppColors.text_black,fontSize: 16,fontWeight: FontWeight.w400),maxLines: 1,)
                            ],
                          ),
                        ),
                      ),
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