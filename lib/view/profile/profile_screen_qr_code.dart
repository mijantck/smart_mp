import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_mp/utils/AppString.dart';
import 'package:path/path.dart' as path;
import '../../controllers/UnitsController.dart';
import '../../controllers/UserController.dart';
import '../../models/respons/UserModel.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../home_page/home_page_screen.dart';
import '../login_regi/UserProfileUpdateScreen.dart';

class ProfileScreenQrCode extends StatefulWidget {
  User user;
  bool isFromLogin;
  ProfileScreenQrCode(this.user,{this.isFromLogin = false});

  @override
  State<ProfileScreenQrCode> createState() => _ProfileScreenQrCodeState();
}

class _ProfileScreenQrCodeState extends State<ProfileScreenQrCode> {

  var utilsController = Get.put(UtilsController());
  var userController = Get.put(UserController());



  List<XFile>? _mediaFileList;
  final ImagePicker _picker = ImagePicker();
  dynamic _pickImageError;
  bool isVideo = false;
  File? _selectedImage;
  String fileName = '';

  bool showLoading = false;

  Future<bool> _onImageButtonPressed(ImageSource source, {required BuildContext context,bool isMedia = false,}) async {

    if (context.mounted) {
      try {
        final List<XFile> pickedFileList = <XFile>[];
        final XFile? media = await _picker.pickMedia(
          imageQuality: 40, // Adjust imageQuality based on the 'isMedia' flag
        );
        if (media != null) {
          pickedFileList.add(media);
          setState(() {
            _mediaFileList = pickedFileList;
            print('shfjsd 1111 ${media.path}');
          });
          return true;
        }
      } catch (e) {
        setState(() {
          print('shfjsd 1111 eee ${e}');
          _pickImageError = e;
        });

        return false;
      }
    }
    return false;
  }


  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents users from dismissing the dialog by tapping outside
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(

          body: GetBuilder<UtilsController>(
              builder: (controller) {
                return Container(
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
                            child: Center(child: Text('Profile        ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColors.text_black),)),
                          )),

                        ],
                      ),
                      SizedBox(height: 10,),

                      SingleChildScrollView(
                        child: Column(
                          children: [

                            Container(
                              height: 200,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    bottom: 30,
                                    left: 90,
                                    right: 90,
                                    child: Image.network(
                                      '${AppString.IMAGE_URL}${widget.user.profileImage}',
                                      errorBuilder: (context, error, stackTrace) {
                                        // Return a default image when the network image fails to load
                                        return Image.asset(AppImages.plaseholder_image,fit: BoxFit.fill,); // Replace 'assets/default_image.png' with your default image asset path
                                      },
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  //

                                ],
                              )

                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),

                                SizedBox(height: 8),
                                _buildInfoText('Name'.tr, widget.user.name == null? '': widget.user.name!),
                                _buildInfoText('Father_name'.tr, widget.user.fatherHusband == null? '': widget.user.fatherHusband!),
                                _buildInfoText('Mother_name'.tr, widget.user.mother == null? '':widget.user.mother!),
                                _buildInfoText('Union_all'.tr, widget.user.union == null? '':widget.user.union!.name!),
                                _buildInfoText('Voting_Center_Name'.tr, widget.user.voterKendro == null? '':widget.user.voterKendro!.name!),
                                _buildInfoText('mobile'.tr, widget.user.mobileNumber == null? '':widget.user.mobileNumber!),
                                _buildInfoText('nid_number'.tr, widget.user.nid == null? '':widget.user.nid!),
                                widget.user.role == 'volunteer' ? _buildInfoText('Referred Cone', widget.user.refferCode!):Container(),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
    ) ;
  }


  Widget _buildInfoText(String label, String value) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
              child: Text('$label :', style: TextStyle(fontSize: 14,color: Colors.grey),)),
          Expanded(
              flex: 7,
              child: Text(' $value', style: TextStyle(fontSize: 14,color: Colors.black),)),
        ],
      ),
    );
  }

}
