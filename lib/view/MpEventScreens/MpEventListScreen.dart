import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/controllers/NewsController.dart';
import 'package:smart_mp/controllers/UnitsController.dart';
import 'package:smart_mp/models/respons/MpEventModel.dart';
import 'package:smart_mp/utils/AppString.dart';
import 'package:smart_mp/view/MpEventScreens/widgets/mp_event_item.dart';

import '../../models/respons/NewModel.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../home_tab/widgets/news_item.dart';

class MpEventListScreen extends StatefulWidget {
  const MpEventListScreen({super.key});

  @override
  State<MpEventListScreen> createState() => _MpEventListScreenState();
}

class _MpEventListScreenState extends State<MpEventListScreen> {

  var utilsController = Get.put(UtilsController());

  @override
  void initState() {
    // TODO: implement initState
    utilsController.fetchMpEvents();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
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
                        child: Center(child: Text(AppString.News,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColors.text_black),)),
                      ))
                    ],
                  ),

                  SizedBox(height: 10,),
                  GetBuilder<UtilsController>(
                    builder: (controller) {
                      if (controller.mpEventsList == null) {
                        // Show a loading indicator while data is being fetched
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return SizedBox(
                          height: controller.mpEventsList!.length * 240,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.mpEventsList!.length,
                            itemBuilder: (context, index) {
                              MpEventModel n = controller.mpEventsList![index];

                              return MpEventItem(n);
                            },
                          ),
                        );
                      }
                    },
                  ),


                ],
              ),
            ),
          )


          ,
        )
    );
  }
}
