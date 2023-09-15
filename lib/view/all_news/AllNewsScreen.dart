import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_mp/controllers/NewsController.dart';
import 'package:smart_mp/utils/AppString.dart';

import '../../models/respons/NewModel.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../home_tab/widgets/news_item.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({super.key});

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 20),
              child: Column(
                children: [
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
                  GetBuilder<NewsController>(
                    builder: (controller) {
                      if (controller.newsList == null) {
                        // Show a loading indicator while data is being fetched
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return SizedBox(
                          height: controller.newsList!.length * 220,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.newsList!.length,
                            itemBuilder: (context, index) {
                              NewModel n = controller.newsList![index];

                              return NewsItem(n);
                            },
                          ),
                        );
                      }
                    },
                  ),


                ],
              ),
            ),
          )


          ,
        )
    );
  }
}
