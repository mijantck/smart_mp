import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_mp/models/requste/UserRegistation.dart';
import 'package:smart_mp/models/respons/DestinationCitizan.dart';
import 'package:smart_mp/models/respons/DestinationParty.dart';
import 'package:smart_mp/models/respons/Upazila.dart';
import 'package:smart_mp/models/respons/committee.dart';
import 'package:smart_mp/view/home_page/home_page_screen.dart';
import 'package:smart_mp/view/login_regi/widgets/CustomTextField.dart';
import 'package:smart_mp/view/login_regi/widgets/drop_dwon.dart';
import 'package:path/path.dart' as path;
import '../../controllers/UnitsController.dart';
import '../../controllers/UserController.dart';
import '../../models/respons/ExecutiveCommittee.dart';
import '../../models/respons/Union.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';

class RegistationScreen extends StatefulWidget {
  const RegistationScreen({super.key});

  @override
  State<RegistationScreen> createState() => _RegistationScreenState();
}

class _RegistationScreenState extends State<RegistationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController fatherController = TextEditingController();
  TextEditingController motherController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController referrerCodeController = TextEditingController();
  TextEditingController nidController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();
  TextEditingController membershipCardNoController = TextEditingController();
  String imageUrl = '';

  List<String> ward = [AppString.seltectItem, '1', '2', '3', '4','5','6','7','8','9'];
  String selectWard = AppString.seltectItem;

  int selectOptionParty = 0;

  String selectedOptionGender = AppString.Male;
  List<String> gender = [AppString.Male, AppString.FeMale, AppString.Others];

  List<XFile>? _mediaFileList;
  final ImagePicker _picker = ImagePicker();
  dynamic _pickImageError;
  bool isVideo = false;
  File? _selectedImage;


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

  Upazila? selectedUpazila;
  Union? selectedUnion;
  Committee? committee;
  ExecutiveCommittee? executiveCommittee;
  DestinationCitizan? destinationCitizan;
  DestinationParty? destinationParty;
  String fileName = '';
  String dateOfBirth = '';



  @override
  Widget build(BuildContext context) {
     return SafeArea(
       child: Scaffold(
        body: SingleChildScrollView(
          child:  GetBuilder<UtilsController>(
         builder: (utilsController) {
           return Column(
             children: [
               SizedBox(
                 width: MediaQuery.of(context).size.width,
                 height: 200,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                         width: 150,
                         height: 150,
                         child: Image.asset(AppImages.home_logo)),
                     SizedBox(height: 10,),
                     Text(AppString.APP_NAME,style: TextStyle(
                         color: AppColors.text_black,
                         fontSize: 20,
                         fontWeight: FontWeight.bold
                     ),)
                   ],
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                 child: Card(
                   child: Column(
                     children: [

                       SizedBox(height: 15,),

                       Container(
                         margin: EdgeInsets.only(left: 5,right: 5),
                         child: Row(
                           children: [
                             Expanded(
                               child: InkWell(
                                 onTap: (){
                                   setState(() {
                                     selectOptionParty = 0;
                                   });
                                 },
                                 child: Container(
                                   color: selectOptionParty == 0 ? AppColors.singin_color : AppColors.white,
                                   height: 40,
                                   child: Center(
                                     child: Text(
                                       AppString.Register_As_Member,
                                       style: TextStyle(
                                           color: selectOptionParty == 0 ? AppColors.white : AppColors.text_black
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                             Expanded(
                               child: InkWell(
                                 onTap: (){
                                   setState(() {
                                     selectOptionParty = 1;
                                   });
                                 },
                                 child: Container(
                                   color: selectOptionParty == 1 ? AppColors.singin_color : AppColors.white,
                                   height: 40,
                                   child: Center(
                                     child: Text(
                                       AppString.Register_As_Member,
                                       style: TextStyle(
                                           color: selectOptionParty == 1 ? AppColors.white : AppColors.text_black
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),

                       SizedBox(height: 15,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(AppString.Let_syou_in,style: TextStyle(color: AppColors.welcome_color,fontSize: 17,fontWeight: FontWeight.w500),)
                         ],
                       ),
                       SizedBox(height: 5,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(selectOptionParty == 0?  AppString.as_party : AppString.Citizen,style: TextStyle(color: AppColors.gray_text,fontSize: 15,fontWeight: FontWeight.w500),)
                         ],
                       ),
                       //Personal info
                       Container(
                         margin: EdgeInsets.only(left: 10),
                         child: Row(
                           children: [
                             Text(AppString.Personal_Information,style: TextStyle(color: AppColors.text_black,fontWeight: FontWeight.w500),),
                           ],
                         ),
                       ),
                       // Name
                       CustomTextField(AppString.Name,AppString.Enter_Your_Name,nameController),

                       // Father_name
                       CustomTextField(AppString.Father_name,AppString.Enter_Your_Father_husband_name,fatherController),

                       // Mother name
                       CustomTextField(AppString.Mother_name,AppString.Enter_Your_Mother_name,motherController),

                       DropDownCustom(
                         title: AppString.Gender,
                         options: gender,
                         selectedOption: selectedOptionGender,
                         onChange: (String? value) { // Handle nullable value
                           if (value != null) {
                             setState(() {
                               selectedOptionGender = value;
                             });
                           }
                         },
                       ),
                       Container(
                         margin: EdgeInsets.only(left: 10),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text(AppString.date_of_Birth ,style: TextStyle(color: AppColors.text_black,fontSize: 17,fontWeight: FontWeight.w500),)
                           ],
                         ),
                       ),

                       InkWell(
                         onTap: (){
                           showDatePicker(
                             context: context,
                             initialDate: DateTime.now(),
                             firstDate: DateTime(1900),
                             lastDate: DateTime.now(),
                           ).then((selectedDate) {
                             if (selectedDate != null) {
                               setState(() {
                                 dateOfBirth = selectedDate.toLocal().toString().split(' ')[0];
                               });
                             }
                           });

                         },
                         child: Container(
                           height: 50,
                           margin: EdgeInsets.only(left: 10,right: 10,top: 4),
                           width: MediaQuery.of(context).size.height,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(5),
                             border: Border.all(color: Colors.grey),
                           ),
                           child: Row(
                             children: [

                               SizedBox(width: 10,),
                               Expanded(
                                 child: Row(
                                   children: [
                                     Center(child: Text(dateOfBirth == ''? AppString.date_of_Birth: dateOfBirth ,textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,))
                                   ],
                                 ),
                               )
                             ],
                           ),
                         ),
                       ),


                      //Union
                       DropDownCustom(
                         title: AppString.Upazila_All,
                         options: utilsController.upazilaString,
                         selectedOption: utilsController.upazilaSelecte.value,
                         onChange: (String? value) { // Handle nullable value
                           if (value != null && value != AppString.seltectItem) {
                             setState(() {
                               utilsController.upazilaSelecte.value = value;
                                selectedUpazila = utilsController.upazila.firstWhere((union) => union.name == value);

                             });
                           }
                         },
                       ),

                       //Union
                       DropDownCustom(
                         title: AppString.Union_all,
                         options: utilsController.unionString,
                         selectedOption: utilsController.unionSelecte.value,
                         onChange: (String? value) { // Handle nullable value
                           if (value != null && value != AppString.seltectItem) {
                             setState(() {
                               utilsController.unionSelecte.value = value;
                               selectedUnion = utilsController.union.firstWhere((union) => union.name == value);

                             });
                           }
                         },
                       ),
                       //Ward
                       DropDownCustom(
                         title: AppString.Ward_all,
                         options: ward,
                         selectedOption: selectWard,
                         onChange: (String? value) { // Handle nullable value
                           if (value != null && value != AppString.seltectItem) {
                             setState(() {
                               selectWard = value;
                             });
                           }
                         },
                       ),

                       Visibility(
                           visible: selectOptionParty == 0? true : false,
                        child: Column(
                         children: [
                           //Committee
                           DropDownCustom(
                             title: AppString.Committee,
                             options: utilsController.committeesString,
                             selectedOption: utilsController.committeesSelecte.value,
                             onChange: (String? value) { // Handle nullable value
                               if (value != null && value != AppString.seltectItem) {
                                 setState(() {
                                   utilsController.committeesSelecte.value = value;
                                   committee = utilsController.committees.firstWhere((union) => union.title == value);

                                 });
                               }
                             },
                           ),


                           //Executive Committee
                           DropDownCustom(
                             title: AppString.ExecutiveCommittee,
                             options: utilsController.executiveCommitteeString,
                             selectedOption: utilsController.executiveCommitteeSelecte.value,
                             onChange: (String? value) { // Handle nullable value
                               if (value != null && value != AppString.seltectItem) {
                                 setState(() {
                                   utilsController.executiveCommitteeSelecte.value = value;
                                   executiveCommittee = utilsController.executiveCommittee.firstWhere((union) => union.title == value);

                                 });
                               }
                             },
                           ),


                           //Party Designation
                           DropDownCustom(
                             title: AppString.PartyDesignation,
                             options: utilsController.destinationPartyString,
                             selectedOption: utilsController.destinationPartySelecte.value,
                             onChange: (String? value) { // Handle nullable value
                               if (value != null && value != AppString.seltectItem) {
                                 setState(() {
                                   utilsController.destinationPartySelecte.value = value;
                                   destinationParty = utilsController.destinationParty.firstWhere((union) => union.name == value);

                                 });
                               }
                             },
                           ),

                           CustomTextField(AppString.membershipCardNo,AppString.membershipCardNoEnter,membershipCardNoController),
                         ],
                       )),






                       //Citezan Designation
                       Visibility(
                         visible: selectOptionParty != 0? true : false,
                         child: Column(
                           children: [
                             DropDownCustom(
                               title: AppString.CitizanDesignation,
                               options: utilsController.destinationCitizanString,
                               selectedOption: utilsController.destinationCitizanSelecte.value,
                               onChange: (String? value) { // Handle nullable value
                                 if (value != null && value != AppString.seltectItem) {
                                   setState(() {
                                     utilsController.destinationCitizanSelecte.value = value;
                                     destinationCitizan = utilsController.destinationCitizan.firstWhere((union) => union.name == value);

                                   });
                                 }
                               },
                             ),
                             CustomTextField(AppString.Referrer_code,AppString.Enter_Your_Referrer_code,referrerCodeController),
                           ],
                         ),
                       ),
                       // Address
                       CustomTextField(AppString.address,AppString.Enter_Your_Address,addressController),
                       Container(
                         margin: EdgeInsets.only(left: 10),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text(AppString.upload_image ,style: TextStyle(color: AppColors.text_black,fontSize: 17,fontWeight: FontWeight.w500),)
                           ],
                         ),
                       ),



                       Container(
                         height: 50,
                         margin: EdgeInsets.only(left: 10,right: 10,top: 4),
                         width: MediaQuery.of(context).size.height,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                           border: Border.all(color: Colors.grey),
                         ),
                         child: Row(
                           children: [
                             Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(6),bottomLeft: Radius.circular(6)),
                                 color: AppColors.gray_withe,
                               ),
                               width: 140,
                               child: InkWell(
                                 onTap: ()async {
                                   _onImageButtonPressed(
                                     ImageSource.gallery,
                                     context: context,
                                     isMedia: true,
                                   ).then((value) async {
                                     if(value == true)  {
                                       setState(() async {
                                         fileName = path.basename(_mediaFileList![0].path);
                                         File imageFile = File(_mediaFileList![0].path);
                                         _selectedImage = File(_mediaFileList![0].path);

                                       });

                                     }
                                   });


                                 },
                                 child: Row(
                                   children: [
                                     SizedBox(width: 10,),
                                     Center(child: Text(AppString.ChooseFile,textAlign: TextAlign.center,))
                                   ],
                                 ),
                               ),
                             ),
                             Expanded(child: Container(
                               child: Row(
                                 children: [
                                   SizedBox(width: 10,),
                                   Expanded(child: Center(child: Text(fileName == ''? AppString.No_file_chosen: fileName ,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)))
                                 ],
                               ),
                             ))
                           ],
                         ),
                       ),
                       SizedBox(height: 10,),
                       if (_selectedImage != null)
                         Container(
                           height: 200,
                           width: 200,
                           decoration: BoxDecoration(
                             border: Border.all(color: Colors.grey),
                             borderRadius: BorderRadius.circular(8),
                           ),
                           child: Image.file(
                             _selectedImage!,
                             fit: BoxFit.cover,
                           ),
                         ),
                       // Nid
                       CustomTextField(AppString.nid_number,AppString.Enter_Your_NID,nidController),

                       SizedBox(height: 20,),
                       //Account info
                       Container(
                         margin: EdgeInsets.only(left: 10),
                         child: Row(
                           children: [
                             Text(AppString.Account_Information,style: TextStyle(color: AppColors.text_black,fontWeight: FontWeight.w500),),
                           ],
                         ),
                       ),
                       //Mobile number
                       CustomTextField(AppString.email,AppString.Enter_Your_email,emailController),

                       CustomTextField(AppString.mobile,AppString.Enter_Your_mobile_no,mobileController),
                       //Password
                       CustomTextField(AppString.password,AppString.Enter_Your_Password,passwordController),
                       //confirm Password
                       CustomTextField(AppString.con_password,AppString.Enter_Your_Con_Password,conPasswordController),

                       //Sing button
                       InkWell(
                         onTap: () async {
                           var userController = Get.put(UserController());



                           if(nameController.text == ''){
                             _showSnackBar(context,'Enter Name');
                             return;
                           }
                           if(fatherController.text == ''){
                             _showSnackBar(context,'Enter Father Name');
                             return;
                           }
                           if(motherController.text == ''){
                             _showSnackBar(context,'Enter Mother Name');
                             return;
                           }

                           if(dateOfBirth == ''){
                             _showSnackBar(context,'Enter Date Of Birth');
                             return;
                           }
                           if(selectedUpazila == null){
                             _showSnackBar(context,'Select Upazila ');
                             return;
                           }
                           if(selectedUnion == null ){
                             _showSnackBar(context,'Enter Union');
                             return;
                           }
                           if(selectWard == ''){
                             _showSnackBar(context,'select Ward');
                             return;
                           }


                           if(selectOptionParty == 0){
                             if(committee  == null ){
                               _showSnackBar(context,'Enter committee');
                               return;
                             }
                             if(executiveCommittee  == null ){
                               _showSnackBar(context,'Enter executive Committee');
                               return;
                             }
                             if(destinationParty  == null ){
                               _showSnackBar(context,'Enter designation Party');
                               return;
                             }
                             if(membershipCardNoController.text  == '' ){
                               _showSnackBar(context,'Enter Membership Card No');
                               return;
                             }

                           }else{
                             if(destinationCitizan  == null ){
                               _showSnackBar(context,'Enter designation citizen');
                               return;
                             }
                           }

                           if(addressController.text  == '' ){
                             _showSnackBar(context,'Enter address');
                             return;
                           }if(nidController.text  == '' ){
                             _showSnackBar(context,'Enter NID');
                             return;
                           }if(emailController.text  == '' ){
                             _showSnackBar(context,'Enter Email');
                             return;
                           }if(mobileController.text  == '' ){
                             _showSnackBar(context,'Enter mobile');
                             return;
                           }
                           if(passwordController.text  == '' ){
                             _showSnackBar(context,'Enter password');
                             return;
                           }

                           if(_mediaFileList == null ){
                             _showSnackBar(context,'Select Image');
                             return;
                           }


                           showLoadingDialog(context);

                           UserRegistation userRegistationParty = selectOptionParty == 0 ?  UserRegistation(
                             name:nameController.text,
                             fatherHusband: fatherController.text,
                             mother: motherController.text,
                             gender: selectedOptionGender,
                             upaziaId: selectedUpazila!.id,
                             unionId: selectedUnion!.id,
                             wardNo: int.parse(selectWard),
                             committeeId: committee!.id,
                             executiveCommitteeId: executiveCommittee!.id,
                             designationPartyId: destinationParty!.id,
                             membershipCardNo: membershipCardNoController.text,
                             designationCitizenId: 1,
                             address: addressController.text,
                             nid: nidController.text,
                             email: emailController.text,
                             mobileNumber: mobileController.text,
                             password: passwordController.text,
                             role:'party',
                             unitId: 1,
                             dateOfBirth: dateOfBirth
                           ) : UserRegistation(
                               name:nameController.text,
                               fatherHusband: fatherController.text,
                               mother: motherController.text,
                               gender: selectedOptionGender,
                               upaziaId: selectedUpazila!.id,
                               unionId: selectedUnion!.id,
                               wardNo: int.parse(selectWard),
                               committeeId: 1,
                               executiveCommitteeId: 1,
                               designationPartyId:1,
                               membershipCardNo: '',
                               designationCitizenId: destinationCitizan!.id,
                               address: addressController.text,
                               nid: nidController.text,
                               email: emailController.text,
                               mobileNumber: mobileController.text,
                               password: passwordController.text,
                               role:'citizen',
                               unitId: 1,
                               dateOfBirth: dateOfBirth,
                               underRefferCode: referrerCodeController.text
                           );



                           //userController.postMultipartData(body, multipartBody)

                           File imageFile = File(_mediaFileList![0].path);
                           //Uint8List? imageBytes = await imageFile.readAsBytes();

                           List<MultipartBody> multipartBody = [
                             MultipartBody(key: 'profile_image', file: _mediaFileList![0],fileName: '${DateTime.now().toString()}_${path.basename(_mediaFileList![0].path)}'),
                           ];

                           Map<String, String> body = userRegistationParty.toJson().map((key, value) => MapEntry(key, value.toString()));
                           userController.postMultipartData(body, multipartBody).then((value) {
                             Navigator.of(context).pop();
                             if(value.isSuccess){
                               Get.offAll(HomePage());
                             }
                             print('hsfjsd ${value.message}');
                           });

                         },
                         child: Container(
                           margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(6),
                               color: AppColors.singin_color
                           ),
                           width: MediaQuery.of(context).size.width,
                           height: 50,
                           child: Center(
                             child: Text(AppString.sing_up,style: TextStyle(color: AppColors.white,fontSize: 18),),
                           ),
                         ),
                       ),

                       SizedBox(height: 40,),
                       Container(
                         height: 20,
                         width: MediaQuery.of(context).size.width,
                         child: Image.asset(AppImages.bg_division,fit: BoxFit.cover,),
                       ),
                       SizedBox(height: 40,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(AppString.Do_you_have_an_account,style: TextStyle(color: AppColors.gray_text,fontSize: 14,fontWeight: FontWeight.w400),),
                           SizedBox(width: 5,),
                           InkWell(
                               onTap: (){
                                 Get.back();
                               },
                               child: Text(AppString.sign_in,style: TextStyle(color: AppColors.text_black,fontSize: 17,fontWeight: FontWeight.w500),))
                         ],
                       ),
                       SizedBox(height: 40,),
                     ],
                   ),
                 ),
               )
             ],
           );
         }),

        ),
    ),);
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

  void _showSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
        duration: Duration(seconds: 1),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            // Handle undo action
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

