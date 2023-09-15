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
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),


          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                child: notification.imageUrl == null? Container(
                    child: Image.asset(AppImages.demo_news_banner)
                ): Image.network(notification.imageUrl!), // Use notification's image URL
              ),
              SizedBox(width: 10,),
              Column(
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
                  Text(notification.message!)
                ],
              )

            ],

          ),
        ),
      ),
    );
  }
}
