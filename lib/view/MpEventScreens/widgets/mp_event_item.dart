import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/models/respons/MpEventModel.dart';
import 'package:smart_mp/models/respons/NewModel.dart';
import 'package:smart_mp/utils/AppColors.dart';
import 'package:smart_mp/utils/AppImages.dart';
import 'package:smart_mp/utils/AppString.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../all_news/DetailsScreen.dart';

class MpEventItem extends StatelessWidget {
  MpEventModel mpEventModel;
  MpEventItem(this.mpEventModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //Get.to(DetailsScreen(newModel: mpEventModel,));

      },
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 210,
          child: Column(
            children: [
              Container(
                height: 150,
                child: Image.network( '${AppString.IMAGE_URL}${mpEventModel.imageUrl!}',fit:BoxFit.cover,),
                //child: Image.asset(AppImages.demo_news_banner,fit:BoxFit.cover,),
              ),

              Container(
                  margin: EdgeInsets.only(left: 5,right: 5,top: 3),
                  child: Text('${mpEventModel.title}',textAlign:TextAlign.start, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.text_black,),maxLines: 2,)),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.blue),
                  SizedBox(width: 5),
                  Text(
                    '${mpEventModel.address}',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.gray_text,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.calendar_today, color: Colors.blue,),
                  SizedBox(width: 5),
                  Text(
                    '${mpEventModel.dateStart}',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.gray_text,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar(
        'Error',
        'Could not launch URL',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
