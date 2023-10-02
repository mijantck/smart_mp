import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smart_mp/view/login_regi/ForgetPassword/widgets/OTPTextFieldMy.dart';

import '../../../controllers/UserController.dart';
import '../../../utils/AppColors.dart';
import '../../../utils/AppImages.dart';
import '../../../utils/AppString.dart';
import '../widgets/CustomTextField.dart';
import 'ChangePasswordScreen.dart';

class VerifyOtpScreen extends StatefulWidget {
  String otp;
  String mobileNumber;

  VerifyOtpScreen(this.otp,this.mobileNumber);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {

  List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());
  int _timerCountdown = 120; // 2 minutes in seconds
  bool _resendButtonEnabled = false;
  Timer? _timer;
  String otpc = '';


  @override
  void initState() {
    super.initState();
    otpc = widget.otp;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerCountdown > 0) {
          _timerCountdown--;
        } else {
          _resendButtonEnabled = true;
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }



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
                            AppString.Enter_Your_OTP,
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
                // CustomTextField(AppString.Enter_Your_OTP, "******", otpController),

                SizedBox(height: 10),
                OTPTextFieldMy(otpControllers),
                SizedBox(height: 10),
                Text(
                  '$_timerCountdown seconds remaining',
                  style: TextStyle(
                    color: AppColors.text_black,
                    fontSize: 16,
                  ),
                ),

                // Resend button

                  Visibility(
                    visible: _resendButtonEnabled,
                    child: ElevatedButton(
                      onPressed: () {
                        var usersController = Get.put(UserController());
                        usersController.sendOtp(widget.mobileNumber).then((value) {
                          if(value.isSuccess){
                            _resendButtonEnabled = false;
                            _timerCountdown = 120;
                            startTimer();
                            setState(() {
                              otpc = value.message;
                            });

                          }
                        });
                        // Implement resend logic here
                        // You can also reset the timer if needed
                        // For example, you can call startTimer() again
                      },
                      child: Text('Resend OTP'),
                    ),
                  ),
                InkWell(
                  onTap: () {
                    String enteredOTP = otpControllers.map((controller) => controller.text).join();

                    if (enteredOTP.isEmpty || enteredOTP.length != 6) {
                      Fluttertoast.showToast(
                        msg: "Please enter a valid OTP",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 12.0,
                      );
                      return;
                    }

                    if (otpc == enteredOTP) {
                      Get.to(ChangePasswordScreen(widget.mobileNumber));
                    } else {
                      Fluttertoast.showToast(
                        msg: "Incorrect OTP. Please try again.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 12.0,
                      );
                    }
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
                        AppString.verify,
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
