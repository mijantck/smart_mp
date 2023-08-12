import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/utils/AppString.dart';
import 'package:smart_mp/view/home_tab/widgets/news_item.dart';

import '../../models/respons/NewModel.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';

class DetailsScreen extends StatelessWidget {
  final NewModel newModel; // The NewModel instance to display details for

  DetailsScreen({required this.newModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the title
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
              Text(
                newModel.title ?? 'No Title',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Display the image (if available)
              if (newModel.imageUrl != null)
                Image.network(AppString.IMAGE_URL+newModel.imageUrl!),
              SizedBox(height: 10),
              // Display the details
              Text(
                newModel.details ?? 'No Details Available.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              // Display other fields as needed (type, createdAt, updatedAt, etc.)
              // ...
            ],
          ),
        ),
      ),
    );
  }
}
