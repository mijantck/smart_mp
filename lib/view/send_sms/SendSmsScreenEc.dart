import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/controllers/UserController.dart';

import '../../controllers/UnitsController.dart';
import '../../models/respons/SocialLinkModel.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';
import '../home_tab/widgets/social_card.dart';

class SendSmsScreenEc extends StatefulWidget {
  String? name;
  String? phone;


  SendSmsScreenEc(this.name, this.phone);

  @override
  State<SendSmsScreenEc> createState() => _SendSmsScreenEcState();
}

class _SendSmsScreenEcState extends State<SendSmsScreenEc> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  child: Image.asset(AppImages.ic_back_button),
                ),
              ),
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(
                  AppString.sms_send,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.text_black),
                )),
              ))
            ],
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            controller: _textEditingController,
            minLines: 5, // Minimum number of lines
            maxLines: null, // Null for unlimited lines
            decoration: InputDecoration(
              hintText: 'Enter text here',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Perform an action with the text entered in the TextField
              String enteredText = _textEditingController.text;
              var userController = Get.put(UserController());
              userController.sendSmsEc(widget.phone!, enteredText).then((value) {
                print('sdhfkjds ${value.isSuccess}');
                if(value.isSuccess){
                  Get.back();
                }
              });
              print('Entered Text: $enteredText');
            },
            child: Text('SEND'),
          ),
        ],
      ),
    )));
  }
}
