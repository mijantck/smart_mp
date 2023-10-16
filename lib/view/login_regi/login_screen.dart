import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_mp/view/login_regi/registation_screen.dart';
import 'package:smart_mp/view/login_regi/widgets/CustomTextField.dart';
import 'package:smart_mp/view/login_regi/widgets/drop_dwon.dart';
import 'package:smart_mp/view/profile/profile_screen.dart';

import '../../controllers/UnitsController.dart';
import '../../controllers/UserController.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';
import '../home_page/home_page_screen.dart';
import '../profile/admin_profile_screen.dart';
import 'ForgetPassword/SendSmsScreen.dart';

class LoginScreen extends StatefulWidget {

  String userTpy;

  LoginScreen({this.userTpy = ''});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var utilsController = Get.put(UtilsController());

  bool rememberMe = false;

  String _selectedValue = 'General';
  var isLoading = false;

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
                    CustomTextField(_selectedValue == 'General'? AppString.mobile:AppString.email ,_selectedValue == 'General'? AppString.Enter_Your_mobile_no:AppString.Enter_Your_email,mobileController),
                    //Password
                    CustomTextField(AppString.password,AppString.Enter_Your_Password,passwordController,isPassword: true,),
                    DropDownCustom(
                      title: 'LogIn_Type'.tr,
                      options: <String>['Coordinator', 'General'],
                      selectedOption: _selectedValue,
                      onChange: (String? value) { // Handle nullable value
                        setState(() {
                          _selectedValue = value!;
                          print('${value}');
                        });
                      },
                    ),

                    // Remember
                    Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe, // Update this with your remember option value
                              onChanged: (value) {
                                setState(() {
                                  rememberMe =  !rememberMe;
                                });
                                // Implement the logic to update the remember option here
                              },
                              checkColor: Colors.grey, // Gray check color
                              activeColor: Colors.transparent, // Transparent background
                            ),
                            Text(
                              'Remember_Me'.tr,
                              style: TextStyle(
                                color: Colors.grey, // Gray color for the text
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        // Forget Password Text
                        GestureDetector(
                          onTap: () async{
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            String? token =  prefs.getString('token');
                            if(token == AppString.admin){
                              Fluttertoast.showToast(
                                msg: 'Contract with Admin',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 12.0,
                              );
                              return;
                            }
                           Get.to(SendSmsScreen());
                          },
                          child: Text(
                            'Forget_Password'.tr,
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


                        if(mobileController.text == ''){

                          Fluttertoast.showToast(
                            msg: _selectedValue == 'General'? AppString.Enter_Your_mobile_no:AppString.Enter_Your_email,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 12.0,
                          );

                          return;
                        }
                        if(passwordController.text == ''){
                          Fluttertoast.showToast(
                            msg: AppString.Enter_Your_Password,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 12.0,
                          );
                          return;
                        }

                        setState(() {
                          isLoading = true;
                        });

                        if(_selectedValue == 'General') {
                          userController.loginUser(mobileController.text, passwordController.text).then((value) {
                            setState(() {
                              isLoading = false;
                            });
                            if (value.isSuccess) {
                              utilsController.changePossition(0);
                              utilsController.loginDone(true);
                              utilsController.updateToken();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(value.message),
                                  backgroundColor: Colors
                                      .red, // You can customize the color
                                ),
                              );
                            }

                          });
                        }else{

                          userController.loginUserAdmin(mobileController.text, passwordController.text).then((value) {
                            setState(() {
                              isLoading = false;
                            });

                            if (value.isSuccess) {
                              utilsController.changePossition(0);
                              utilsController.loginDone(true);
                              utilsController.updateToken();
                            } else {
                              Fluttertoast.showToast(
                                msg: value.message,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 12.0,
                              );
                            }


                          });



                        }


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
                          child: isLoading ? CircularProgressIndicator() : Text(AppString.sign_in,style: TextStyle(color: AppColors.white,fontSize: 18),),
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
            ),
            SizedBox(height: 10,)
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
