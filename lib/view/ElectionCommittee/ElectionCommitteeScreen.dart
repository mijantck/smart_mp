import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/controllers/UnitsController.dart';
import 'package:smart_mp/models/respons/UserModel.dart';

import '../../controllers/UserController.dart';
import '../../models/respons/AdminLoginModel.dart';
import '../../models/respons/Union.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';
import '../login_regi/widgets/CustomTextField.dart';
import '../login_regi/widgets/drop_dwon.dart';
import '../widgets/UsersItem.dart';

class ElectionCommitteeScreen extends StatefulWidget {
  bool fromHome;


  ElectionCommitteeScreen({this.fromHome = true});

  @override
  State<ElectionCommitteeScreen> createState() => _ElectionCommitteeScreenState();
}

class _ElectionCommitteeScreenState extends State<ElectionCommitteeScreen> {


  TextEditingController nameText = TextEditingController();
  TextEditingController mobileNo = TextEditingController();

  var usersListController = Get.put(UserController());
  var utilsController = Get.put(UtilsController());


  String userType = 'election_commission';

  int page_number = 1;
  Union? selectedUnion;
  VoterKendro? selectedVotkendroName;
  bool showSearch = false;
  bool loadingButton = false;
  List<Roles>? roles;
  AdminModel? coordinator;


  @override
  void initState() {
    usersListController.totalUsers = 0;
    usersListController.userListModelData = [];

    if(usersListController.userModel != null){
      User? user = usersListController.userModel!.user;
      if(user != null){
        if(user.roles != null)
          roles = user.roles;
        if(user.voterKendro != null)
          selectedVotkendroName = user.voterKendro;
        if(user.coordinator != null)
          coordinator = user.coordinator;
      }
    }

    if(usersListController.adminLoginModel != null){
      if(usersListController.adminLoginModel!.user!.userRole == 'coordinator'){

        utilsController.fetchVoterKendrosUnderCo('${usersListController.adminLoginModel!.user!.id!}').then((value) {
          print('dsjfksd ${utilsController.voterKendros.length}');

          selectedVotkendroName = utilsController.voterKendros[0];
          utilsController.voterKendrosSelecte.value = selectedVotkendroName!.name!;

          usersListController.fetchUsersRegisterList(1, userType,
              voterKendroNo: selectedVotkendroName != null? selectedVotkendroName!.voterKendroNo! : '',
              isFromCo: true,
              admin_id: '${usersListController.adminLoginModel!.user!.id!}'
          );
        });



      }else{
        utilsController.fetchVoterKendros();
        usersListController.fetchUsersRegisterList(1, userType,
            voterKendroNo: selectedVotkendroName != null? selectedVotkendroName!.voterKendroNo! : ''
        );
      }
    }else{
      utilsController.fetchVoterKendros();
      usersListController.fetchUsersRegisterList(1, userType,
          voterKendroNo: selectedVotkendroName != null? selectedVotkendroName!.voterKendroNo! : ''
      );
    }


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
                          AppString.Voting_Center_Committee,
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
              widget.fromHome ? Container() : Column(
                children: [
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
                ],
              ),

              SizedBox(height: 10),
              GetBuilder<UserController>(
                  builder: (userController) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppString.Voting_Center_Committee,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: AppColors.text_black,
                                  ),
                                ),
                                Text(': ${userController.totalUsers!}',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColors.text_black,
                                ),)
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Voting_Center_no'.tr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: AppColors.text_black,
                                  ),
                                ),
                                Text(': ${selectedVotkendroName == null? '' : selectedVotkendroName!.voterKendroNo!}',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColors.text_black,
                                ),)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text('Voting_Center_Name'.tr,style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 3,),
                        Text('${selectedVotkendroName == null? '' : selectedVotkendroName!.name}'),
                        coordinator == null? Container() : Column(
                          children: [
                            SizedBox(height: 5,),
                            Text('Coordinator'.tr,style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 3,),
                            Text('${coordinator == null? '' : coordinator!.userName}'),
                          ],
                        )

                      ],);
                  }),
              SizedBox(height: 10),
              showSearch ? Expanded(
                child: ListView(
                  children: [
                    GetBuilder<UtilsController>(
                        builder: (utilsController) {
                          return Column(
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
                              DropDownCustom(
                                title: 'Voting_Center_Name'.tr,
                                options: utilsController.voterKendrosString,
                                selectedOption: utilsController.voterKendrosSelecte.value,
                                onChange: (String? value) { // Handle nullable value
                                  if (value != null && value != AppString.seltectItem) {
                                    setState(() {
                                      utilsController.voterKendrosSelecte.value = value;
                                      selectedVotkendroName = utilsController.voterKendros.firstWhere((votkendroName) => votkendroName.name == value);
                                    });
                                  }else if(value == AppString.seltectItem){
                                    setState(() {
                                      utilsController.voterKendrosSelecte.value = AppString.seltectItem;
                                      selectedVotkendroName = null;
                                    });
                                    print('dsjf 1111 ${value}');
                                  }
                                },
                              ),
                              CustomTextField(AppString.Name,AppString.Enter_Your_Name,nameText),
                              CustomTextField(AppString.mobile,AppString.Enter_Your_mobile_no,mobileNo),
                              loadingButton? Center(child: CircularProgressIndicator()) :  ElevatedButton(
                                onPressed: () {
                                  // Implement your search logic here
                                  String union_id='';
                                  if(selectedUnion != null)
                                    union_id = '&union_id=${selectedUnion!.id}';
                                  String selectedVotkendroNo ='';
                                  if(selectedVotkendroName !=null)
                                    selectedVotkendroNo = '&voter_kendro_no=${selectedVotkendroName!.voterKendroNo}';
                                  String nameGetText = '&name=${nameText.text}';
                                  String mobileNoGetText = '&mobile_number=${mobileNo.text}';
                                  String searQuery = '${selectedUnion != null? union_id:''}${selectedVotkendroName != null? selectedVotkendroNo:''}${nameText.text != ''?nameGetText:''}${mobileNo.text != ''?mobileNoGetText :''}';
                                  print('dsfhsdj ${searQuery}');
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
          )
        ),
      ),
    );
  }


}
