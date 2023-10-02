import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/view/VoterList/widgwts/VoterItem.dart';

import '../../controllers/VoterListController.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';
import '../login_regi/widgets/CustomTextField.dart';
import '../login_regi/widgets/drop_dwon.dart';

class VoterListScreen extends StatefulWidget {
  const VoterListScreen({super.key});

  @override
  State<VoterListScreen> createState() => _VoterListScreenState();
}

class _VoterListScreenState extends State<VoterListScreen> {
  var voterListController = Get.put(VoterListController());
  TextEditingController nidController = TextEditingController();

  int page_number = 1;
  String _selectedValue = 'নতুন'; // Initial selected value

  @override
  void initState() {
    // TODO: implement initState
    voterListController.fetchVoterList(page_number);

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
                          AppString.bagmaraVoterTalika,
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

              // Search Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    CustomTextField(AppString.nid_number,AppString.Enter_Your_NID,nidController),
                    DropDownCustom(
                      title: 'LogIn_Type'.tr,
                      options: <String>['নতুন', 'পুরানো'],
                      selectedOption: _selectedValue,
                      onChange: (String? value) { // Handle nullable value
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),

                    ElevatedButton(
                      onPressed: () {
                        // Implement your search logic here
                        String searchText = nidController.text;
                        String voterType = _selectedValue == 'নতুন' ? 'new' : 'old';

                        // Call a method to filter and update the list based on searchText

                         voterListController.fetchSearchingList(searchText,voterType);
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
                      voterListController.loadNextPage();
                    }
                    return false;
                  },
                  child: GetBuilder<VoterListController>(
                    builder: (controller) {
                      if (controller.voterListModelData == null) {
                        // Show a loading indicator while data is being fetched
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Column(
                          children: [
                            Expanded(
                              child: controller.voterListModelData.isEmpty
                                  ? Center(child: Text('No Items'))
                                  : ListView.builder(
                                itemCount: controller.voterListModelData.length,
                                itemBuilder: (context, index) {
                                  return VoterItem(controller.voterListModelData[index]);
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
