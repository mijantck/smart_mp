import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/controllers/UnitsController.dart';

import 'package:smart_mp/utils/AppString.dart';
import 'package:smart_mp/utils/AppColors.dart';
import 'package:smart_mp/view/bagmara_aboutScreen/widgets/AboutItem.dart';

import '../../models/respons/BagmaraAboutModel.dart';
import '../../utils/AppImages.dart';

class BagmaraAboutScreen extends StatefulWidget {
  const BagmaraAboutScreen({Key? key}) : super(key: key);

  @override
  _BagmaraAboutScreenState createState() => _BagmaraAboutScreenState();
}

class _BagmaraAboutScreenState extends State<BagmaraAboutScreen> {
  var aboutController = Get.put(UtilsController()); // Replace with your controller

  @override
  void initState() {
    super.initState();
    aboutController.fetchBagmaraAbout(); // Replace with your data fetching method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
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
                          AppString.Smart_Bagmara.tr, // Set the title as needed
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
              Expanded(
                child: SingleChildScrollView(
                  child: GetBuilder<UtilsController>(
                    builder: (controller) {
                      if (controller.mBagmaraAboutModel == null) {
                        return Center(child: CircularProgressIndicator());
                      } else if (controller.mBagmaraAboutModel.isEmpty) {

                        return Center(child: Text("No information available."));
                      } else {

                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.mBagmaraAboutModel.length,
                          itemBuilder: (context, index) {
                            BagmaraAboutModel aboutModel = controller.mBagmaraAboutModel[index];
                            return AboutItem(bagmaraAboutModel: aboutModel,);
                          },
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
