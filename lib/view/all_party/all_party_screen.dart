import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/models/respons/committee.dart';

import '../../controllers/UnitsController.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';
import '../home_tab/widgets/item_card.dart';
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
}
