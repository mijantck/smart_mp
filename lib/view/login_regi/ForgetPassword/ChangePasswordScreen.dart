import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smart_mp/view/home_page/home_page_screen.dart';

import '../../../controllers/UserController.dart';
import '../../../utils/AppColors.dart';
import '../../../utils/AppImages.dart';
import '../../../utils/AppString.dart';
import '../widgets/CustomTextField.dart';

class ChangePasswordScreen extends StatefulWidget {
  String mobile_number;
  ChangePasswordScreen(this.mobile_number);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Image.asset(AppImages.ic_back_button),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            AppString.Change_Password,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.text_black,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        child: Image.asset(AppImages.home_logo),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Smart Bagmara'.tr,
                        style: TextStyle(
                          color: AppColors.text_black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                CustomTextField(AppString.password, AppString.Enter_Your_Password, newPasswordController, isPassword: true),
                CustomTextField(AppString.con_password, AppString.Enter_Your_Con_Password, confirmPasswordController, isPassword: true),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    var userController = Get.put(UserController());
                    showLoadingDialog(context);

                    // Add logic to change the password here
                    userController.changePasswordOtp(widget.mobile_number, newPasswordController.text, confirmPasswordController.text).then((value) {
                      Navigator.of(context).pop();
                      if (value.isSuccess) {
                        // Show a success message or navigate to a success screen

                        Fluttertoast.showToast(
                          msg: value.message,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 12.0,
                        );
                        Get.off(HomePage());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(value.message),
                            backgroundColor: Colors.red, // You can customize the color
                          ),
                        );
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.singin_color,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Center(
                      child: Text(
                        AppString.Change_Password,
                        style: TextStyle(color: AppColors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
