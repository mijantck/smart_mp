import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/utils/AppImages.dart';

import '../../models/respons/NotiificationModel.dart';
import 'NotificationDetailsScreen.dart';

class NotificationItem extends StatelessWidget {
  final NotiificationModel notification;

  NotificationItem({required this.notification});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(NotificationDetailsScreen(notiificationModel: notification,));
      },
      child: Card(
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: 60,
                  height: 60,

                  child: notification.imageUrl == null? Container(
                      width: 60,
                      height: 60,
                      child: Image.asset(AppImages.home_logo)
                  ): Image.network(notification.imageUrl!), // Use notification's image URL
                ),
              ),

              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      notification.title!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(notification.message!,maxLines: 1,)
                  ],
                ),
              )

            ],

          ),
        ),
      ),
    );
  }
}
