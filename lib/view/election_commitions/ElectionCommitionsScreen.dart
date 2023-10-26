import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_mp/controllers/UnitsController.dart';
import 'package:smart_mp/view/election_commitions/widgets/ElectionCoItemCard.dart';

import '../../controllers/UserController.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';

import '../Convener/ConvenerScreen.dart';
import '../ElectionCommittee/ElectionCommitteeScreen.dart';
import '../PollingAgent/PollingAgentScreen.dart';
import '../login_regi/login_screen.dart';

class ElectionCommissionsScreen extends StatefulWidget {
  const ElectionCommissionsScreen({super.key});

  @override
  State<ElectionCommissionsScreen> createState() => _ElectionCommissionsScreenState();
}

class _ElectionCommissionsScreenState extends State<ElectionCommissionsScreen> {

  var utilsController = Get.put(UtilsController());
  TextEditingController nidController = TextEditingController();

  var usersListController = Get.put(UserController());

  String userType = 'election_commission';
  @override
  void initState() {
    // TODO: implement initState
    //usersListController.fetchUsersRegisterList(1, userType);

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
                    
                    if(utilsController.tokens == null){
                      Get.to(LoginScreen());
                    }else{
                      Get.to(ElectionCommitteeScreen());
                      // if(usersListController.userModel != null){
                      //   if(usersListController.userRoles.contains(AppString.election_commissionTag)){
                      //     Get.to(ElectionCommitteeScreen());
                      //   }else{
                      //     utilsController.showToast('You are not Vote center Committee');
                      //   }
                      // }else{
                      //   Get.to(ElectionCommitteeScreen());
                      // }
                     
                    }

                  }),
                  ElectionCoItemCard(AppImages.polling_agent, AppString.Polling_agent,()async{

                    if(utilsController.tokens == null){
                      Get.to(LoginScreen());
                    }else{
                      Get.to(PollingAgentScreen());
                      // if(usersListController.userModel != null){
                      //   if(usersListController.userRoles.contains(AppString.polling_agentTag)){
                      //     Get.to(PollingAgentScreen());
                      //   }else{
                      //     utilsController.showToast('You are not Polling agent');
                      //   }
                      // }else{
                      //   Get.to(PollingAgentScreen());
                      // }

                    }
                  }),
                  ElectionCoItemCard(AppImages.ic_coordinator, 'convener'.tr,()async{
                    if(utilsController.tokens == null){
                      Get.to(LoginScreen());
                    }else{
                      Get.to(ConvenerScreen());

                      // if(utilsController.tokens == AppString.admin){
                      //   Get.to(ConvenerScreen());
                      // }else{
                      //   utilsController.showToast('You are not Coordinator');
                      //
                      // }

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
