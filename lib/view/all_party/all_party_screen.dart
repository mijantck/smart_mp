import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/models/respons/committee.dart';

import '../../controllers/UnitsController.dart';
import '../../models/respons/DestinationParty.dart';
import '../../models/respons/Union.dart';
import '../../models/respons/UserModel.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';
import '../home_tab/widgets/item_card.dart';
import '../login_regi/widgets/drop_dwon.dart';
import '../party_all/party_all_screen.dart';
import '../party_member/party_members_screen.dart';

class AllPartyScreen extends StatefulWidget {
  String executiveCommitteeName;
  int executiveCommitteeId;

  AllPartyScreen(this.executiveCommitteeName,this.executiveCommitteeId);

  @override
  State<AllPartyScreen> createState() => _AllPartyScreenState();
}

class _AllPartyScreenState extends State<AllPartyScreen> {


  List<String> ward = [AppString.seltectItem, '1', '2', '3', '4','5','6','7','8','9'];
  String selectWard = AppString.seltectItem;

  Committee? committee;
  DestinationParty? destinationParty;
  Union? selectedUnion;
  bool showSearch = false;
  bool loadingButton = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: GetBuilder<UtilsController>(
          builder: (controller) {
          return Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Image.asset(AppImages.ic_back_button),
                      ),
                    ),
                    Expanded(child: Container(
                      width:MediaQuery.of(context).size.width,
                      child: Center(child: Text(widget.executiveCommitteeName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColors.text_black),)),
                    ))
                  ],
                ),
                SizedBox(height: 10,),

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
                showSearch ? Expanded(
                  child: ListView(
                    children: [
                      GetBuilder<UtilsController>(
                          builder: (utilsController) {
                            return Column(
                              children: [
                                DropDownCustom(
                                  title: AppString.Committee,
                                  options: utilsController.committeesString,
                                  selectedOption: utilsController.committeesSelecte.value,
                                  onChange: (String? value) {
                                    if (value != null && value != AppString.seltectItem) {
                                      setState(() {
                                        utilsController.committeesSelecte.value = value;
                                        committee = utilsController.committees.firstWhere((union) => union.title == value);
                                      });
                                    }else if(value == AppString.seltectItem){
                                      setState(() {
                                        utilsController.committeesSelecte.value = AppString.seltectItem;
                                        committee = null;
                                      });
                                      print('dsjf 1111 ${value}');
                                    }
                                  },
                                ),
                                SizedBox(height: 20),
                                DropDownCustom(
                                  title: AppString.PartyDesignation,
                                  options: utilsController.destinationPartyString,
                                  selectedOption: utilsController.destinationPartySelecte.value,
                                  onChange: (String? value) {
                                    if (value != null && value != AppString.seltectItem) {
                                      setState(() {
                                        utilsController.destinationPartySelecte.value = value;
                                        destinationParty = utilsController.destinationParty.firstWhere((party) => party.name == value);
                                      });
                                    }else if(value == AppString.seltectItem){
                                      setState(() {
                                        utilsController.destinationPartySelecte.value = AppString.seltectItem;
                                        destinationParty = null;
                                      });
                                      print('dsjf 1111 ${value}');
                                    }
                                  },
                                ),
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

                                loadingButton ? Center(child: CircularProgressIndicator()) :  ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      showSearch = false;
                                      loadingButton = false;
                                    });

                                    Get.to(PartyMembersScreen(
                                      widget.executiveCommitteeName,
                                      committee==null?"":committee!.title!,
                                      widget.executiveCommitteeId,
                                      committeesId: committee==null?0:committee!.id!,
                                      union_id: selectedUnion==null?0:selectedUnion!.id!,
                                      designationPartyId:destinationParty ==null?0:destinationParty!.id!,
                                      ward_no: selectWard == AppString.seltectItem?0:int.parse(selectWard),
                                    ));


                                    // Implement your search logic here
                                    // String union_id='';
                                    // if(selectedUnion != null)
                                    //   union_id = '&union_id=${selectedUnion!.id}';
                                    // String selectedVotkendroNo ='';
                                    // if(selectedVotkendroName !=null)
                                    //   selectedVotkendroNo = '&voter_kendro_no=${selectedVotkendroName!.voterKendroNo}';
                                    // String nameGetText = '&name=${nameText.text}';
                                    // String mobileNoGetText = '&mobile_number=${mobileNo.text}';
                                    // String searQuery = '${selectedUnion != null? union_id:''}${selectedVotkendroName != null? selectedVotkendroNo:''}${nameText.text != ''?nameGetText:''}${mobileNo.text != ''?mobileNoGetText :''}';
                                    // print('dsfhsdj ${searQuery}');
                                    // loadingButton = true;
                                    // usersListController.fetchSearchingList(1,searQuery,userType).then((value) {

                                    // });
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
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Change this to the number of items you want to show horizontally
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    ),
                    itemCount:  controller.committees.length, // Change this to the number of items you want in the grid
                    itemBuilder: (context, index) {
                      // Replace this with the code to build your grid item

                      Committee committee = controller.committees[index];

                      return ItemCard(committee.imageUrl!, committee.title!, () => {
                        Get.to(PartyMembersScreen(widget.executiveCommitteeName,committee.title!,widget.executiveCommitteeId,committeesId: committee.id!,))

                       // Get.to(AllPartyScreen(committee.title!))
                      });
                    },
                  ),
                ),

              ],
            ),
          );
        })


          ,
        )
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {


        return GetBuilder<UtilsController>(
          builder: (utilsController) {
            return AlertDialog(
              title: Text("Select Options"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropDownCustom(
                    title: AppString.Committee,
                    options: utilsController.committeesString,
                    selectedOption: utilsController.committeesSelecte.value,
                    onChange: (String? value) {
                      if (value != null && value != AppString.seltectItem) {
                        setState(() {
                          utilsController.committeesSelecte.value = value;
                          committee = utilsController.committees.firstWhere((union) => union.title == value);
                        });
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  DropDownCustom(
                    title: AppString.PartyDesignation,
                    options: utilsController.destinationPartyString,
                    selectedOption: utilsController.destinationPartySelecte.value,
                    onChange: (String? value) {
                      if (value != null && value != AppString.seltectItem) {
                        setState(() {
                          utilsController.destinationPartySelecte.value = value;
                          destinationParty = utilsController.destinationParty.firstWhere((party) => party.name == value);
                        });
                      }
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text("Apply"),
                  onPressed: () {
                    // Handle applying options here
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

}
