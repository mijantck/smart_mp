import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/controllers/UnitsController.dart';

import 'package:smart_mp/utils/AppString.dart';
import 'package:smart_mp/utils/AppColors.dart';

import '../../models/respons/NotiificationModel.dart';
import '../../utils/AppImages.dart';
import 'NotificationItem.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var notificationController = Get.put(UtilsController());

  @override
  void initState() {
    super.initState();
    notificationController.fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 20),
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
                          AppString.News,
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
                      if (controller.mNotiificationModel == null) {
                        // Show a loading indicator while data is being fetched
                        return Center(child: CircularProgressIndicator());
                      } else if (controller.mNotiificationModel.isEmpty) {
                        // Display a message when there are no notifications
                        return Center(child: Text("No notifications available."));
                      } else {
                        // Display the list of notifications
                        return ListView.builder(
                          shrinkWrap: true, // Ensure the ListView doesn't take up too much space
                          itemCount: controller.mNotiificationModel.length,
                          itemBuilder: (context, index) {
                            NotiificationModel notification =
                            controller.mNotiificationModel[index];
                            return NotificationItem(notification: notification);
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
