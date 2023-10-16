import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/view/VoterList/widgwts/VoterItem.dart';

import '../../controllers/UnitsController.dart';
import '../../controllers/VoterListController.dart';
import '../../models/respons/Union.dart';
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
  TextEditingController birthDayText = TextEditingController();
  TextEditingController nameText = TextEditingController();
  TextEditingController mobileNo = TextEditingController();

  int page_number = 1;
  String _selectedValue = 'নতুন'; // Initial selected value
  Union? selectedUnion;
  List<String> ward = [AppString.seltectItem, '1', '2', '3', '4','5','6','7','8','9'];
  String selectWard = AppString.seltectItem;
  bool showSearch = false;
  bool loadingButton = false;
  String dateOfBirth = '';
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
              showSearch ? Expanded(
                child: ListView(
                  children: [
                    GetBuilder<UtilsController>(
                        builder: (utilsController) {
                          return  Column(
                            children: [
                              //Union
                              DropDownCustom(
                                title: AppString.Union_all,
                                options: utilsController.unionString,
                                selectedOption: utilsController.unionSelecte.value,
                                onChange: (String? value) { // Handle nullable value
                                  if (value != null && value != AppString.seltectItem) {
                                    setState(() {
                                      utilsController.unionSelecte.value = value;
                                      selectedUnion = utilsController.union.firstWhere((union) => union.name == value);

                                    });
                                  }else if(value == AppString.seltectItem){
                                    setState(() {
                                      utilsController.unionSelecte.value = AppString.seltectItem;
                                      selectedUnion = null;
                                    });
                                    print('dsjf 1111 ${value}');
                                  }
                                },
                              ),
                              //Ward
                              DropDownCustom(
                                title: AppString.Ward_all,
                                options: ward,
                                selectedOption: selectWard,
                                onChange: (String? value) { // Handle nullable value
                                  if (value != null && value != AppString.seltectItem) {
                                    setState(() {
                                      selectWard = value;
                                    });
                                  }else if(value == AppString.seltectItem){
                                    setState(() {
                                      selectWard = AppString.seltectItem;
                                    });
                                    print('dsjf 1111 ${value}');
                                  }
                                },
                              ),
                              CustomTextField("Voting_area".tr,'Voting_area'.tr,nidController),
                              InkWell(
                                onTap: (){
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                  ).then((selectedDate) {
                                    if (selectedDate != null) {
                                      setState(() {
                                        dateOfBirth = selectedDate.toLocal().toString().split(' ')[0];
                                      });
                                    }
                                  });

                                },
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.only(left: 10,right: 10,top: 4),
                                  width: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Row(
                                    children: [

                                      SizedBox(width: 10,),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Center(child: Text(dateOfBirth == ''? AppString.date_of_Birth: dateOfBirth ,textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              CustomTextField(AppString.Name,AppString.Enter_Your_Name,nameText),
                              CustomTextField(AppString.mobile,AppString.Enter_Your_mobile_no,mobileNo),



                              ElevatedButton(
                                onPressed: () {
                                  String voterType = _selectedValue == 'নতুন' ? 'new' : 'old';

                                  String union_id='';
                                  if(selectedUnion != null)
                                    union_id = '&union_id=${selectedUnion!.id}';
                                  String selectedVotkendroNo ='';
                                  // if(selectedVotkendroName !=null)
                                  //   selectedVotkendroNo = '&voter_kendro_no=${selectedVotkendroName!.voterKendroNo}';
                                  String nameGetText = '&name=${nameText.text}';
                                  String dateOfBirthGetText = '&date_of_birth=${dateOfBirth}';
                                  String mobileNoGetText = '&mobile_number=${mobileNo.text}';
                                  String searQuery = '${selectedUnion != null? union_id:''}${dateOfBirthGetText != ''?dateOfBirthGetText:''}${nameText.text != ''?nameGetText:''}${mobileNo.text != ''?mobileNoGetText :''}';
                                  loadingButton = true;
                                  voterListController.fetchSearchingList(1,searQuery,'new').then((value) {
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
              ) : Container(),

              showSearch ? Container(): Flexible(
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
