import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/view/login_regi/registation_screen.dart';
import 'package:smart_mp/view/login_regi/widgets/CustomTextField.dart';
import 'package:smart_mp/view/profile/profile_screen.dart';

import '../../controllers/UserController.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';
import '../home_page/home_page_screen.dart';

class LoginScreen extends StatefulWidget {

  String userTpy;

  LoginScreen({this.userTpy = ''});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {





    return Scaffold(
      body: SingleChildScrollView(
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
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Card(
                child: Column(

                  children: [
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('welcome_back'.tr,style: TextStyle(color: AppColors.welcome_color,fontSize: 17,fontWeight: FontWeight.w500),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('sign_in'.tr,style: TextStyle(color: AppColors.gray_text,fontSize: 15,fontWeight: FontWeight.w500),)
                      ],
                    ),
                    //Mobile number
                    CustomTextField(AppString.mobile,AppString.Enter_Your_mobile_no,mobileController),
                    //Password
                    CustomTextField(AppString.password,AppString.Enter_Your_Password,passwordController,isPassword: true,),

                    // Remember
                    Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: false, // Update this with your remember option value
                              onChanged: (value) {
                                // Implement the logic to update the remember option here
                              },
                              checkColor: Colors.grey, // Gray check color
                              activeColor: Colors.transparent, // Transparent background
                            ),
                            Text(
                              'Remember Me',
                              style: TextStyle(
                                color: Colors.grey, // Gray color for the text
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        // Forget Password Text
                        GestureDetector(
                          onTap: () {
                            // Implement the forget password logic here
                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              color: Colors.red, // Custom red color for the text
                            ),
                          ),
                        ),
                        SizedBox(width: 10,)
                      ],
                    ),

                    //Sing button
                    InkWell(
                      onTap: (){
                        var userController = Get.put(UserController());
                        showLoadingDialog(context);
                        userController.loginUser(mobileController.text, passwordController.text).then((value){
                          Navigator.of(context).pop();
                          print('dsfh ${value.message}');

                          if(value.isSuccess){
                            var userController = Get.put(UserController());

                            Get.to(ProfileScreen(userController.userModel!.user!,isFromLogin:true));
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
                          child: Text(AppString.sign_in,style: TextStyle(color: AppColors.white,fontSize: 18),),
                        ),
                      ),
                    ),

                    SizedBox(height: 40,),
                    Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(AppImages.bg_division,fit: BoxFit.cover,),
                    ),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppString.Don_t_have_an_account,style: TextStyle(color: AppColors.gray_text,fontSize: 14,fontWeight: FontWeight.w400),),
                        SizedBox(width: 5,),
                        InkWell(
                            onTap: (){
                              Get.to(RegistationScreen());
                            },
                            child: Text(AppString.sing_up,style: TextStyle(color: AppColors.text_black,fontSize: 17,fontWeight: FontWeight.w500),))
                      ],
                    ),
                    SizedBox(height: 40,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
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
