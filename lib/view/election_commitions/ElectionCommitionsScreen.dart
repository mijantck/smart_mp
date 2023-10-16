import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_mp/view/election_commitions/widgets/ElectionCoItemCard.dart';

import '../../controllers/UserController.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';
import '../Coordinator/CoordinatorScreen.dart';
import '../ElectionCommittee/ElectionCommitteeScreen.dart';
import '../PollingAgent/PollingAgentScreen.dart';
import '../login_regi/login_screen.dart';
import '../login_regi/widgets/CustomTextField.dart';
import '../widgets/UsersItem.dart';

class ElectionCommissionsScreen extends StatefulWidget {
  const ElectionCommissionsScreen({super.key});

  @override
  State<ElectionCommissionsScreen> createState() => _ElectionCommissionsScreenState();
}

class _ElectionCommissionsScreenState extends State<ElectionCommissionsScreen> {


  TextEditingController nidController = TextEditingController();

  var usersListController = Get.put(UserController());

  String userType = 'election_commission';
  @override
  void initState() {
    // TODO: implement initState
    usersListController.fetchVoterList(1, userType);

    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                          AppString.Election_Committee,
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

              Row(
                children: [
                  ElectionCoItemCard(AppImages.election_committee, AppString.Voting_Center_Committee,()async{

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    String? token =  prefs.getString('token');
                    if(token == null){
                      Get.to(LoginScreen());
                    }else{
                      Get.to(ElectionCommitteeScreen());
                    }

                  }),
                  ElectionCoItemCard(AppImages.polling_agent, AppString.Polling_agent,()async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    String? token =  prefs.getString('token');
                    if(token == null){
                      Get.to(LoginScreen());
                    }else{
                      Get.to(PollingAgentScreen());
                    }

                  }),
                  ElectionCoItemCard(AppImages.ic_coordinator, 'convener'.tr,()async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    String? token =  prefs.getString('token');
                    if(token == null){
                      Get.to(LoginScreen());
                    }else{
                      if(token == AppString.admin){
                        Get.to(CoordinatorScreen());
                      }else{
                        Fluttertoast.showToast(
                          msg: 'You are not Coordinator',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 12.0,
                        );
                      }

                    }

                  }),
                ],
              )
              // Flexible(
              //   child: NotificationListener<ScrollNotification>(
              //     onNotification: (ScrollNotification scrollInfo) {
              //       if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
              //         // Load the next page when scrolling reaches the end
              //         usersListController.loadNextPage(userType);
              //       }
              //       return false;
              //     },
              //     child: GetBuilder<UserController>(
              //       builder: (controller) {
              //         if (controller.userListModelData == null) {
              //           // Show a loading indicator while data is being fetched
              //           return Center(child: CircularProgressIndicator());
              //         } else {
              //           return Column(
              //             children: [
              //               Expanded(
              //                 child: controller.userListModelData.isEmpty
              //                     ? Center(child: Text('No Items'))
              //                     : ListView.builder(
              //                   itemCount: controller.userListModelData.length,
              //                   itemBuilder: (context, index) {
              //                     return UsersItem(controller.userListModelData[index]);
              //                   },
              //                 ),
              //               ),
              //             ],
              //           );
              //         }
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }


}
