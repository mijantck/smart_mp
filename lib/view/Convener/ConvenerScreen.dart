import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/controllers/UnitsController.dart';
import 'package:smart_mp/view/Convener/widgwts/ConvenerItem.dart';

import '../../controllers/UserController.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';
import '../login_regi/widgets/CustomTextField.dart';
import '../widgets/UsersItem.dart';

class ConvenerScreen extends StatefulWidget {
  const ConvenerScreen({super.key});

  @override
  State<ConvenerScreen> createState() => _ConvenerScreenState();
}

class _ConvenerScreenState extends State<ConvenerScreen> {


  TextEditingController nidController = TextEditingController();

  var usersListController = Get.put(UserController());
  var utilsController = Get.put(UtilsController());

  String userType = 'polling_agent';
  @override
  void initState() {
    // if(usersListController.adminLoginModel != null){
    //   if(usersListController.adminLoginModel!.user!.userRole == 'coordinator') {
    //     utilsController.fetchConvener(coordinator_id:'${ usersListController.adminLoginModel!.user!.id}');
    //   }
    // }else{
    //   utilsController.fetchConvener();
    // }
    utilsController.fetchConvener();

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
                          'convener'.tr,
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
              Flexible(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                      // Load the next page when scrolling reaches the end
                     // usersListController.loadNextPage(userType);
                    }
                    return false;
                  },
                  child: GetBuilder<UtilsController>(
                    builder: (controller) {
                      if (controller.conveners == null) {
                        // Show a loading indicator while data is being fetched
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Column(
                          children: [
                            Expanded(
                              child: controller.conveners.isEmpty
                                  ? Center(child: Text('No Items'))
                                  : ListView.builder(
                                itemCount: controller.conveners.length,
                                itemBuilder: (context, index) {
                                  return ConvenerItem(controller.conveners[index]);
                                },
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
