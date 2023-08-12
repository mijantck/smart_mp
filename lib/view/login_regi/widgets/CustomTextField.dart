import 'package:flutter/material.dart';

import '../../../utils/AppColors.dart';
import '../../../utils/AppString.dart';

class CustomTextField extends StatelessWidget {
  String title;
  String title_hints;
  TextEditingController controller;
  CustomTextField(this.title, this.title_hints, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      child:

      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title ,style: TextStyle(color: AppColors.text_black,fontSize: 17,fontWeight: FontWeight.w500),)
            ],
          ),
          SizedBox(height: 4,),
          Container(
            height: 50,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: AppColors.home_bg, // Set the border color
                  ),
                ),
                hintText:title_hints, // Custom hint text
                hintStyle: TextStyle(
                  color: Colors.grey, // Custom hint text color
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
