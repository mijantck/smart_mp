import 'package:flutter/material.dart';
import 'package:smart_mp/utils/AppColors.dart';
import 'package:smart_mp/utils/AppImages.dart';
import 'package:smart_mp/utils/AppString.dart';

import '../../../models/respons/SocialLinkModel.dart';

class SocislItemCard extends StatelessWidget {
  SocialLinkModel socialLinkModel;

  double fontSize;
  Function() onTab;

  SocislItemCard(this.socialLinkModel,  this.onTab,{this.fontSize= 14});


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
                child: Image.network(socialLinkModel.id == 0 ? socialLinkModel.imageUrl! : '${AppString.IMAGE_URL}${socialLinkModel.imageUrl!}',fit: BoxFit.cover,),
                //child: Image.asset(imageUrl,fit: BoxFit.cover,),
              ),
              SizedBox(height: 8,),
              Expanded(child: Container()),
              Text(socialLinkModel.name!, maxLines: 1,textAlign:TextAlign.center, style: TextStyle(fontSize: fontSize),),
              SizedBox(height: 7,),
            ],
          ),
        ),
      ),
    );
  }
}
