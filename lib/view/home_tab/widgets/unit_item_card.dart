import 'package:flutter/material.dart';
import 'package:smart_mp/utils/AppColors.dart';
import 'package:smart_mp/utils/AppImages.dart';

class UnitItemCard extends StatelessWidget {
  String imageUrl;
  String title;
  double fontSize;
  Function() onTab;

  UnitItemCard(this.imageUrl, this.title, this.onTab,{this.fontSize= 12});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Card(
        child: Container(
          margin: EdgeInsets.all(5),
          height: 113,
          width: MediaQuery.of(context).size.width *0.428,
          child: Column(
            children: [
              SizedBox(height: 5,),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    height: 70,
                      width: 70,
                      child: Image.asset(imageUrl,fit: BoxFit.cover,)),
                ),
              ),
              SizedBox(height: 9,),
              Text(title,maxLines: 1,textAlign:TextAlign.center, style: TextStyle(fontSize: fontSize),)
            ],
          ),
        ),
      ),
    );
  }
}
