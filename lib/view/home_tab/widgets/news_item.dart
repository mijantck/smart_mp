import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/models/respons/NewModel.dart';
import 'package:smart_mp/utils/AppColors.dart';
import 'package:smart_mp/utils/AppImages.dart';
import 'package:smart_mp/utils/AppString.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../all_news/DetailsScreen.dart';

class NewsItem extends StatelessWidget {
  NewModel newModel;
  NewsItem(this.newModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(newModel.type == 'url'){
          _launchURL(newModel.url);
        }else{
          Get.to(DetailsScreen(newModel: newModel,));
        }
      },
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Column(
            children: [
              Container(
                height: 150,
                child: Image.network( '${AppString.IMAGE_URL}${newModel.imageUrl!}',fit:BoxFit.cover,),
                //child: Image.asset(AppImages.demo_news_banner,fit:BoxFit.cover,),
              ),

              Container(
                  margin: EdgeInsets.only(left: 5,right: 5,top: 3),
                  child: Text('${newModel.title}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.text_black,),maxLines: 2,)),

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
