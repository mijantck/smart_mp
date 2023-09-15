import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/view/party_member/widgets/member_item.dart';

import '../../controllers/MemberController.dart';
import '../../controllers/UserController.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';
import '../home_tab/widgets/item_card.dart';

class PartyMembersScreen extends StatefulWidget {
  String selectePartyName;
  int executiveCommitteeId;
  int committeesId;

  PartyMembersScreen(this.selectePartyName,this.executiveCommitteeId, this.committeesId);

  @override
  State<PartyMembersScreen> createState() => _PartyMembersScreenState();
}

class _PartyMembersScreenState extends State<PartyMembersScreen> {

  var memberController =  Get.put(MemberController());

  @override
  void initState() {

    memberController.getMembers('party',widget.executiveCommitteeId,widget.committeesId);

    super.initState();

  }


  @override
  Widget build(BuildContext context) {



    return SafeArea(
        child: Scaffold(
          body: Container(
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
                      child: Center(child: Text(widget.selectePartyName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColors.text_black),)),
                    ))
                  ],
                ),

                SizedBox(height: 10,),
                Flexible(child: GetBuilder<MemberController>(
                        builder: (controller) {
                          if (controller.memberModel == null) {
                            // Show a loading indicator while data is being fetched
                            return Center(child: CircularProgressIndicator());
                          }else {
                            return Column(
                              children: [
                                Expanded(
                                    child: controller.memberModel!.length == 0 ? Center(child: Text('No Item'),) : ListView.builder(
                                        itemCount: controller.memberModel!.length,
                                        itemBuilder: (context, index){
                                          return  MemberItem(controller.memberModel![index]);
                                        }
                                    ))

                              ],
                            );
                          }

                        }))

              ],
            ),
          ),
        )
    );
  }
}

