import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  TextEditingController nidController = TextEditingController();

  var usersListController = Get.put(UserController());

  String userType = 'volunteer';
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    CustomTextField(AppString.nid_number,AppString.Enter_Your_NID,nidController),
                    ElevatedButton(
                      onPressed: () {
                        // Implement your search logic here
                        String searchText = nidController.text;

                        // Call a method to filter and update the list based on searchText

                        usersListController.fetchSearchingList(searchText,userType);
                      },
                      child: Text('Search_here'.tr),
                    ),
                  ],
                ),
              ),

              Flexible(
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
