import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/UnitsController.dart';
import '../../../controllers/UserController.dart';
import '../../../utils/AppColors.dart';
import '../../../utils/AppImages.dart';
import '../../../utils/AppString.dart';
import '../widgets/CustomTextField.dart';
import 'ChangePasswordScreen.dart';
import 'VerifyOtpScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendSmsScreen extends StatefulWidget {
  String mobileNumber;


  SendSmsScreen({this.mobileNumber=''});

  @override
  State<SendSmsScreen> createState() => _SendSmsScreenState();
}

class _SendSmsScreenState extends State<SendSmsScreen> {

  TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    mobileController.text = widget.mobileNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
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
                        child: Center(child: Text(AppString.Send_OTP,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColors.text_black),)),
                      ))
                    ],
                  ),

                  SizedBox(height: 10,),
                  GetBuilder<UtilsController>(
                    builder: (controller) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 150,
                                      height: 150,
                                      child: Image.asset(AppImages.home_logo)),
                                  SizedBox(height: 10,),
                                  Text('Smart Bagmara'.tr,style: TextStyle(
                                      color: AppColors.text_black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                            ),
                            CustomTextField(AppString.mobile,AppString.Enter_Your_mobile_no,mobileController),
                            SizedBox(height: 10,),
                            InkWell(
                              onTap: (){

                                if(mobileController.text == ''){
                                  Fluttertoast.showToast(
                                      msg: "Enter Mobile number ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                  return;
                                }
                                var userController = Get.put(UserController());
                                showLoadingDialog(context);

                                userController.sendOtp(mobileController.text).then((value){
                                  Navigator.of(context).pop();
                                  print('dsfh ${value.message}');


                                  if(value.isSuccess){
                                    Get.to(VerifyOtpScreen(value.message,mobileController.text));
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(value.message),
                                        backgroundColor: Colors.red, // You can customize the color
                                      ),
                                    );
                                  }
                                  print('hsfjsd ${value.message}');
                                });



                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: AppColors.singin_color
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Center(
                                  child: Text(AppString.Send_OTP,style: TextStyle(color: AppColors.white,fontSize: 18),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),


                ],
              ),
            ),
          )


          ,
        )
    );
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents users from dismissing the dialog by tapping outside
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

