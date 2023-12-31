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
import '../../models/respons/UserModel.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppImages.dart';
import '../../utils/AppString.dart';

class UserProfileUpdateScreen extends StatefulWidget {
  final User user;

  UserProfileUpdateScreen(this.user);

  @override
  _UserProfileUpdateScreenState createState() => _UserProfileUpdateScreenState();
}

class _UserProfileUpdateScreenState extends State<UserProfileUpdateScreen> {


  var utilsController = Get.put(UtilsController());




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
  void initState() {
    super.initState();
    // Initialize the text controllers with the user's current information
     nameController.text = widget.user.name! ?? '';
     fatherController.text = widget.user.fatherHusband ?? '';
     motherController.text = widget.user.mother ?? '';
     addressController.text = widget.user.address ?? '';
     nidController.text = widget.user.nid?? '';
     emailController.text = widget.user.email?? '';
     mobileController.text = widget.user.mobileNumber?? '';
     passwordController.text =  '';
     conPasswordController.text = '';
     membershipCardNoController.text = widget.user.membershipCardNo ?? '';
     selectWard = widget.user.wardNo!;


    dateOfBirth =widget.user.dateOfBirth == null? '': widget.user.dateOfBirth!;
    utilsController.upazilaSelecte.value = widget.user.upazila!.name!;
    selectedUpazila = utilsController.upazila.firstWhere((union) => union.name == widget.user.upazila!.name!);

    utilsController.unionSelecte.value = widget.user.union!.name!;
    selectedUnion = utilsController.union.firstWhere((union) => union.name == widget.user.union!.name!);



    if(widget.user.committee != null){
      utilsController.committeesSelecte.value = widget.user.committee!.title!;
      committee = utilsController.committees.firstWhere((union) => union.title == widget.user.committee!.title!);

    }

    if(widget.user.executiveCommittee != null){
      utilsController.executiveCommitteeSelecte.value = widget.user.executiveCommittee!.title!;;
      executiveCommittee = utilsController.executiveCommittee.firstWhere((union) => union.title == widget.user.executiveCommittee!.title!);

    }

    if(widget.user.designationParty != null){
      utilsController.destinationPartySelecte.value = widget.user.designationParty!.name!;
      destinationParty = utilsController.destinationParty.firstWhere((union) => union.name == widget.user.designationParty!.name!);
    }


    if(widget.user.designationCitizen != null){
      utilsController.destinationCitizanSelecte.value = widget.user.designationCitizen!.name!;
      destinationCitizan = utilsController.destinationCitizan.firstWhere((union) => union.name == widget.user.designationCitizen!.name!);

    }




  }



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
                      height: 60,
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
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
                            child: Center(child: Text('Update profile       ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColors.text_black),)),
                          ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                      child: Card(
                        child: Column(
                          children: [
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

                            Column(
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
                            ),






                            //Citezan Designation
                            Column(
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
                                //CustomTextField(AppString.Referrer_code,AppString.Enter_Your_Referrer_code,referrerCodeController),
                              ],
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
                                            setState(()  {
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

                                showLoadingDialog(context);

                                UserRegistation userRegistationParty = selectOptionParty == 0 ?

                                UserRegistation(
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
                                    unitId: 1,
                                    dateOfBirth: dateOfBirth,
                                    underRefferCode: referrerCodeController.text
                                );



                                //userController.postMultipartData(body, multipartBody)

                                List<MultipartBody>? multipartBody;

                                if(_mediaFileList != null){
                                  File imageFile = File(_mediaFileList![0].path);
                                  List<MultipartBody> multipartBody = [
                                    MultipartBody(key: 'profile_image', file: _mediaFileList![0],fileName: '${DateTime.now().toString()}_${path.basename(_mediaFileList![0].path)}'),
                                  ];
                                }


                                Map<String, String> body = userRegistationParty.toJson().map((key, value) => MapEntry(key, value.toString()));

                                print('fsbhfdb ${body}');

                                userController.updateUser(body, '${widget.user.id}').then((value) {
                                  Navigator.of(context).pop();
                                  if(value.isSuccess){
                                    print('fhsdjkfhkdsj');

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
                                  child: Text(AppString.update,style: TextStyle(color: AppColors.white,fontSize: 18),),
                                ),
                              ),
                            ),


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
