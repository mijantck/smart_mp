import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/models/respons/committee.dart';

import '../../controllers/UnitsController.dart';
import '../../models/respons/DestinationParty.dart';
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
                GestureDetector(
                  onTap: () {
                    _showDialog();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.gray_withe
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 18,
                          width: 18,
                          child: Image.asset(AppImages.ic_searching,width: 18,height: 18,),
                        ),
                        SizedBox(width: 10,),
                        Text(AppString.Search_here+'...',style: TextStyle(color: AppColors.gray_text),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
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
                        Get.to(PartyMembersScreen(committee.title!,widget.executiveCommitteeId,committee.id!))

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
        Committee? committee;
        DestinationParty? destinationParty;

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
