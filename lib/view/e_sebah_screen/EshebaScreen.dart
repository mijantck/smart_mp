import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/controllers/UnitsController.dart';
import 'package:smart_mp/models/respons/ESebahModel.dart';
import 'package:smart_mp/view/e_sebah_screen/widgets/EShebaItemView.dart';

import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';

class EshebaScreen extends StatefulWidget {
  const EshebaScreen({super.key});

  @override
  State<EshebaScreen> createState() => _EshebaScreenState();
}

class _EshebaScreenState extends State<EshebaScreen> {
  var utilsController =  Get.put(UtilsController());



  @override
  void initState() {
    utilsController.fetchEsheba();

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
                      child: Center(child: Text(AppString.E_sheba,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColors.text_black),)),
                    ))
                  ],
                ),

                SizedBox(height: 10,),
                Flexible(
                  child: GetBuilder<UtilsController>(
                    builder: (controller) {
                      if (controller.eSebahModel == null) {
                        // Show a loading indicator while data is being fetched
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return SizedBox(
                          height: controller.eSebahModel.length * 210,
                          child: ListView.builder(

                            shrinkWrap: true,
                            itemCount: controller.eSebahModel!.length,
                            itemBuilder: (context, index) {
                              ESebahModel n = controller.eSebahModel![index];

                              return EShebaItemView(eSheba: n,);

                            },
                          ),
                        );
                      }
                    },
                  ),
                ),




              ],
            ),
          )


          ,
        )
    );;
  }
}
