import 'package:flutter/material.dart';
import 'package:smart_mp/utils/AppColors.dart';
import 'package:smart_mp/utils/AppImages.dart';
import 'package:smart_mp/utils/AppString.dart';

class ItemCard extends StatelessWidget {
  String imageUrl;
  String title;
  double fontSize;
  Function() onTab;

  ItemCard(this.imageUrl, this.title, this.onTab,{this.fontSize= 14});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Card(
        child: Container(
          margin: EdgeInsets.all(5),
          height: 113,
          width: MediaQuery.of(context).size.width *0.270,
          child: Column(
            children: [
              SizedBox(height: 8,),
              Container(
                height: 60,
                width: 60,
                child: Image.network('${AppString.IMAGE_URL}$imageUrl',fit: BoxFit.cover,),
                //child: Image.asset(imageUrl,fit: BoxFit.cover,),
              ),
              SizedBox(height: 8,),
              Expanded(child: Container()),
              Text(title, maxLines: 1,textAlign:TextAlign.center, style: TextStyle(fontSize: fontSize),),
              SizedBox(height: 7,),
            ],
          ),
        ),
      ),
    );
  }
}
