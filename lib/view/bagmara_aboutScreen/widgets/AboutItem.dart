import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/utils/AppImages.dart';
import 'package:smart_mp/utils/AppString.dart';

import '../../../models/respons/BagmaraAboutModel.dart';
import '../AboutDetailsScreen.dart';

class AboutItem extends StatelessWidget {
  final BagmaraAboutModel bagmaraAboutModel;

  AboutItem({required this.bagmaraAboutModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(AboutDetailsScreen(bagmaraAboutModel: bagmaraAboutModel,));
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
                child: bagmaraAboutModel.imageUrl == null? Container(
                    child: Image.asset(AppImages.demo_news_banner)
                ): Image.network(AppString.IMAGE_URL+bagmaraAboutModel.imageUrl!), // Use notification's image URL
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bagmaraAboutModel.title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(bagmaraAboutModel.details!,maxLines: 1,)
                ],
              )

            ],

          ),
        ),
      ),
    );
  }
}
