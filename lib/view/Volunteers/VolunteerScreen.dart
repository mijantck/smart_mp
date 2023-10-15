import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/UnitsController.dart';
import '../../controllers/UserController.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';
import '../login_regi/widgets/CustomTextField.dart';
import '../widgets/UsersItem.dart';

class VolunteerScreen extends StatefulWidget {
  const VolunteerScreen({super.key});

  @override
  State<VolunteerScreen> createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {

  TextEditingController nameText = TextEditingController();
  TextEditingController mobileNo = TextEditingController();

  var usersListController = Get.put(UserController());

  String userType = 'volunteer';
  int page_number = 1;
  bool showSearch = false;
  bool loadingButton = false;

  @override
  void initState() {
    // TODO: implement initState
    usersListController.userListModelData = [];

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
                          AppString.Volunteer,
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
              InkWell(
                onTap: (){
                  setState(() {
                    showSearch = !showSearch;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.blue.shade50,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Center(child: Text('Search'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),))),
                      Positioned(
                          right: 10,
                          bottom: 0,
                          top: 0,
                          child: Icon(showSearch? Icons.arrow_drop_up :Icons.arrow_drop_down_sharp)
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              GetBuilder<UserController>(
                  builder: (userController) {
                    return Row(
                      children: [
                        Text(
                          AppString.Volunteer,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColors.text_black,
                          ),
                        ),
                        Text(': ${userController.totalUsers!}',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.text_black,
                        ),)
                      ],
                    );
                  }),
              SizedBox(height: 10),
              showSearch ? Expanded(
                child: ListView(
                  children: [
                    GetBuilder<UtilsController>(
                        builder: (utilsController) {
                          return Column(
                            children: [
                              CustomTextField(AppString.Name,AppString.Enter_Your_Name,nameText),
                              CustomTextField(AppString.mobile,AppString.Enter_Your_mobile_no,mobileNo),
                              loadingButton? Center(child: CircularProgressIndicator()) :  ElevatedButton(
                                onPressed: () {
                                  String nameGetText = '&name=${nameText.text}';
                                  String mobileNoGetText = '&mobile_number=${mobileNo.text}';
                                  String searQuery = '${nameText.text != ''?nameGetText:''}${mobileNo.text != ''?mobileNoGetText :''}';

                                  loadingButton = true;
                                  usersListController.fetchSearchingList(1,searQuery,userType).then((value) {
                                    setState(() {
                                      showSearch = false;
                                      loadingButton = false;

                                    });
                                  });
                                },
                                child: Text('Search_here'.tr),
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ): Container(),

              showSearch ? Container(): Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                      // Load the next page when scrolling reaches the end
                      usersListController.loadNextPage(userType);
                    }
                    return false;
                  },
                  child: GetBuilder<UserController>(
                    builder: (controller) {
                      if (controller.userListModelData == null) {
                        // Show a loading indicator while data is being fetched
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Column(
                          children: [
                            Expanded(
                              child: controller.userListModelData.isEmpty
                                  ? Center(child: Text('No Items'))
                                  : ListView.builder(
                                itemCount: controller.userListModelData.length,
                                itemBuilder: (context, index) {
                                  return UsersItem(controller.userListModelData[index]);
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
