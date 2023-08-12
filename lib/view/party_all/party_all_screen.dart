import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/controllers/UnitsController.dart';
import 'package:smart_mp/models/respons/ExecutiveCommittee.dart';
import 'package:smart_mp/utils/AppColors.dart';
import 'package:smart_mp/utils/AppImages.dart';
import 'package:smart_mp/utils/AppString.dart';
import 'package:smart_mp/view/all_party/all_party_screen.dart';
import 'package:smart_mp/view/home_tab/widgets/unit_item_card.dart';

import '../../models/respons/committee.dart';
import '../home_tab/widgets/item_card.dart';

class PartyAll extends StatefulWidget {
  const PartyAll({super.key});

  @override
  State<PartyAll> createState() => _PartyAllState();
}

class _PartyAllState extends State<PartyAll> {
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
                                child: Center(child: Text(AppString.Bagmara_Awami_League,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColors.text_black),)),
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
                              itemCount: controller.executiveCommittee.length, // Change this to the number of items you want in the grid
                              itemBuilder: (context, index) {
                                // Replace this with the code to build your grid item

                                ExecutiveCommittee executiveCommittee = controller.executiveCommittee[index];
                                return ItemCard(executiveCommittee.imageUrl!, executiveCommittee.title!, () => {
                                  Get.to(AllPartyScreen(executiveCommittee.title!,executiveCommittee.id!))
                                });
                              },
                            ),
                          ),

                          // Row(
                          //   children: [
                          //     ItemCard(AppImages.ic_awamilig, AppString.Upazila_All, () => {
                          //       Get.to(AllPartyScreen(AppString.Upazila_All))
                          //     }),
                          //     ItemCard(AppImages.ic_union_all, AppString.Union_all, () => null),
                          //     ItemCard(AppImages.ic_ward, AppString.Ward_all, () => null),
                          //   ],
                          // ),
                        ],
                      ),
                    );
                  })

          ,
        )
    );
  }
}
