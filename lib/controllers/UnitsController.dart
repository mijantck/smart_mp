import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_mp/models/respons/AdminLoginModel.dart';
import 'package:smart_mp/models/respons/ESebahModel.dart';
import 'package:smart_mp/models/respons/MpEventModel.dart';
import 'package:smart_mp/models/respons/SettingsModel.dart';
import 'dart:convert';

import 'package:smart_mp/utils/AppString.dart';
import '../models/respons/BagmaraAboutModel.dart';
import '../models/respons/DestinationCitizan.dart';
import '../models/respons/DestinationParty.dart';
import '../models/respons/ExecutiveCommittee.dart';
import '../models/respons/NotiificationModel.dart';
import '../models/respons/SliderModel.dart';
import '../models/respons/SocialLinkModel.dart';
import '../models/respons/Union.dart';
import '../models/respons/Unit.dart';
import '../models/respons/Upazila.dart';
import '../models/respons/UserModel.dart';
import '../models/respons/committee.dart';
import '../models/respons/responseModel.dart';
import '../utils/ApiClient.dart';


class UtilsController extends GetxController {


  RxBool showQrCode = true.obs;

  RxBool openAppValue = false.obs;

  var committees = <Committee>[].obs;
  var committeesString = <String>[].obs;
  RxString committeesSelecte = AppString.seltectItem.obs;

  var executiveCommittee = <ExecutiveCommittee>[].obs;
  var executiveCommitteeString = <String>[].obs;
  RxString executiveCommitteeSelecte = AppString.seltectItem.obs;

  var destinationParty = <DestinationParty>[].obs;
  var destinationPartyString = <String>[].obs;
  RxString destinationPartySelecte = AppString.seltectItem.obs;

  var destinationCitizan = <DestinationCitizan>[].obs;
  var destinationCitizanString = <String>[].obs;
  RxString destinationCitizanSelecte = AppString.seltectItem.obs;

  var union = <Union>[].obs;
  var unionString = <String>[].obs;
  RxString unionSelecte = AppString.seltectItem.obs;

  var unit = <Unit>[].obs;
  var unitString = <String>[].obs;
  RxString unitSelecte = AppString.seltectItem.obs;

  var upazila = <Upazila>[].obs;

  var upazilaString = <String>[].obs;
  RxString upazilaSelecte = AppString.seltectItem.obs;

  var eSebahModel = <ESebahModel>[].obs;
  var socialLinkModel = <SocialLinkModel>[].obs;
  var mpEventsList = <MpEventModel>[].obs;
  var mNotiificationModel = <NotiificationModel>[].obs;
  var mBagmaraAboutModel = <BagmaraAboutModel>[].obs;


  var tabPossition = 0;



  @override
  void onInit() {
    super.onInit();
    // Fetch slider data from API or any other source
    openApp();
    fetchCommittees();
    fetchExecutiveCommittee();
    fetchDestinationParty();
    fetchDestinationCitizan();
    fetchUnion();
    fetchUnit();
    fetchUpazila();
    fetchVoterKendros();
  }


  changePossition(int posstion){
    this.tabPossition = posstion;
    update();
  }

  updateShowQrCode(bool showQrCode){
    this.showQrCode.value = showQrCode;
    update();
  }

  bool loginBol = false;
  loginDone(bool loginBol){
    this.loginBol = loginBol;
    update();
  }

  String? tokens;
  updateToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('token') == ''){
      this.tokens = null;
    }else{
      this.tokens = prefs.getString('token');
    }
    print('sjhfjs ${this.tokens}');
    update();
  }


  Future<ResponseModel> openApp() async {
    try {
      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('https://smartmp1.mrsoftit.xyz/public/api/open-app'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        print('sdfhsdjkf $jsonData');
        openAppValue.value = jsonData;
        update();
        return ResponseModel(true, 'API call successful.');
      }else{
        openAppValue.value = true;
        return ResponseModel(true, 'API call successful.');
      }
    } catch (e) {
      openAppValue.value = true;
      return ResponseModel(true, 'API call successful.');
      print('Error fetching committees: $e');
    }
  }


  var voterKendros = <VoterKendro>[].obs;
  var voterKendrosString = <String>[].obs;
  RxString voterKendrosSelecte = AppString.seltectItem.obs;


  Future<void> fetchVoterKendros() async {
    try {
      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/get-voter-kendos'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List<dynamic>;
        var voterKendrosList = jsonData.map((item) => VoterKendro.fromJson(item)).toList();
        voterKendros.value = voterKendrosList;
        voterKendrosString.add(AppString.seltectItem);
        voterKendrosList.forEach((element) {
          voterKendrosString.add(element.name!);
        });
        print('sdhfsd ${voterKendrosString.length}');
        update();
      }
    } catch (e) {
      print('Error fetching committees: $e');
    }
  }


  Future<void> fetchVoterKendrosUnderCo(String admin_id) async {
    try {

      voterKendros.value = [];
      voterKendrosString.value = [];
      voterKendrosSelecte  = AppString.seltectItem.obs;

      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/voter-kendros/$admin_id'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List<dynamic>;
        var voterKendrosList = jsonData.map((item) => VoterKendro.fromJson(item)).toList();
        voterKendros.value = voterKendrosList;
        voterKendrosString.add(AppString.seltectItem);
        voterKendrosList.forEach((element) {
          voterKendrosString.add(element.name!);
        });
        print('sdhfsd ${voterKendrosString.length}');
        update();
      }
    } catch (e) {
      print('Error fetching committees: $e');
    }
  }

  var conveners = <AdminModel>[].obs;
  var convenersString = <String>[].obs;
  RxString convenersSelect = AppString.seltectItem.obs;

  Future<void> fetchConvener() async {
    try {
      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/get-conveners'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List<dynamic>;
        var convenersList = jsonData.map((item) => AdminModel.fromJson(item)).toList();
        conveners.value = convenersList;
        convenersString.add(AppString.seltectItem);
        convenersList.forEach((element) {
          convenersString.add(element.userName!);
        });
        print('sdhfsd ${voterKendrosString.length}');
        update();
      }
    } catch (e) {
      print('Error fetching committees: $e');
    }
  }



  Future<void> fetchCommittees() async {
    try {
      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/getCommittees'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List<dynamic>;
        var committeesList = jsonData.map((item) => Committee.fromJson(item)).toList();
        committees.value = committeesList;
        committeesString.add(AppString.seltectItem);
        committeesList.forEach((element) {
          committeesString.add(element.title!);
        });
        update();
      }
    } catch (e) {
      print('Error fetching committees: $e');
    }
  }


  void fetchExecutiveCommittee() async {
    try {
      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/getExecutiveCommittee'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List<dynamic>;
        var executiveCommitteeList = jsonData.map((item) => ExecutiveCommittee.fromJson(item)).toList();
        executiveCommittee.value = executiveCommitteeList;
        executiveCommitteeString.add(AppString.seltectItem);
        executiveCommitteeList.forEach((element) {
          executiveCommitteeString.add(element.title!);
        });
        update();
      }
    } catch (e) {
      print('Error fetching sliders: $e');
    }
  }

  void fetchDestinationParty() async {
    try {
      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/getDestinationParty'));
      print('skgfsdjh 33 ${response.body}');
      if (response.statusCode == 200) {
        print('skgfsdjh 33 ${response.statusCode}');
        var jsonData = json.decode(response.body) as List<dynamic>;
        var destinationPartyList = jsonData.map((item) => DestinationParty.fromJson(item)).toList();
        destinationParty.value = destinationPartyList;
        destinationPartyString.add(AppString.seltectItem);
        destinationPartyList.forEach((element) {
          destinationPartyString.add(element.name!);

        });
        update();
      }
    } catch (e) {
      print('Error fetching sliders: $e');
    }
  }

  void fetchDestinationCitizan() async {
    try {
      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/getDestinationCitizan'));
      print('skgfsdjh 44 ${response.body}');
      if (response.statusCode == 200) {
        print('skgfsdjh  44 ${response.statusCode}');
        var jsonData = json.decode(response.body) as List<dynamic>;
        var destinationCitizanList = jsonData.map((item) => DestinationCitizan.fromJson(item)).toList();
        destinationCitizan.value = destinationCitizanList;
        destinationCitizanString.add(AppString.seltectItem);
        destinationCitizanList.forEach((element) {
          destinationCitizanString.add(element.name!);
        });
        update();

      }
    } catch (e) {
      print('Error fetching sliders: $e');
    }
  }

  void fetchUnion() async {
    try {
      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/getUnion'));
      print('skgfsdjh 55 ${response.body}');
      if (response.statusCode == 200) {
        print('skgfsdjh 55 ${response.statusCode}');
        var jsonData = json.decode(response.body) as List<dynamic>;
        var unionList = jsonData.map((item) => Union.fromJson(item)).toList();
        union.value = unionList;
        unionString.add(AppString.seltectItem);
        unionList.forEach((element) {
          unionString.add(element.name!);
        });
        update();
      }
    } catch (e) {
      print('Error fetching sliders: $e');
    }
  }

  void fetchUnit() async {
    try {
      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/getUnit'));
      print('skgfsdjh 66 ${response.body}');
      if (response.statusCode == 200) {
        print('skgfsdjh 66 ${response.statusCode}');
        var jsonData = json.decode(response.body) as List<dynamic>;
        var unitList = jsonData.map((item) => Unit.fromJson(item)).toList();
        unit.value = unitList;
        unitString.add(AppString.seltectItem);
        unitList.forEach((element) {
          unitString.add(element.name!);

        });
        update();
      }
    } catch (e) {
      print('Error fetching sliders: $e');
    }
  }

  void fetchUpazila() async {
    try {
      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/getUpazila'));
      print('skgfsdjh 77 ${response.body}');
      if (response.statusCode == 200) {
        print('skgfsdjh 77 ${response.statusCode}');
        var jsonData = json.decode(response.body) as List<dynamic>;
        var upazilaList = jsonData.map((item) => Upazila.fromJson(item)).toList();
        upazila.value = upazilaList;
        upazilaString.add(AppString.seltectItem);
        upazilaList.forEach((element) {
          upazilaString.add(element.name!);
        });
        update();
      }
    } catch (e) {
      print('Error fetching sliders: $e');
    }
  }


  void fetchEsheba() async {
    try {
      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/e_sheba'));
      print('skgfsdjh 77 ${response.body}');
      if (response.statusCode == 200) {
        print('skgfsdjh 77 ${response.statusCode}');
        var jsonData = json.decode(response.body) as List<dynamic>;
        var esebahList = jsonData.map((item) => ESebahModel.fromJson(item)).toList();
        eSebahModel.value = esebahList;
        update();
      }
    } catch (e) {
      print('Error fetching sliders: $e');
    }
  }


  void fetchSocialLink() async {

      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/social-links'));
      print('sdfsdsdds 333 ${response.statusCode}');
      if (response.statusCode == 200) {
        print('sdfsdsdds 1111');
        print('sfgf${response.body}');
        var jsonData = json.decode(response.body) as List<dynamic>;
        var socialLinkModelList = jsonData.map((item) => SocialLinkModel.fromJson(item)).toList();
        socialLinkModel.value = socialLinkModelList;
        update();
      }else{
        print('sdfsdsdds 999');
        socialLinkModel.value = [
          SocialLinkModel(
            id: 0,
            imageUrl:'https://i.ibb.co/CMr41kr/icons8-facebook-144.png',
            name: 'Facebook',
            phone: '',
            value: 'https://www.facebook.com/engrenamulhaquemp',
          ),
          SocialLinkModel(
            id: 0,
            imageUrl:'https://i.ibb.co/CQ0ccKZ/icons8-instagram-144.png',
            name: 'Instagram',
            phone: '',
            value: 'https://www.instagram.com/mp_enamulhaque/',
          ),

          SocialLinkModel(
            id: 0,
            imageUrl:'https://i.ibb.co/NTtnZJJ/icons8-youtube-144.png',
            name: 'Youtube',
            phone: '',
            value: 'https://enamulhaquemp.com/',
          ),SocialLinkModel(
            id: 0,
            imageUrl:'https://i.ibb.co/Jk219mM/icons8-internet-96.png',
            name: 'Web site',
            phone: '',
            value: 'https://enamulhaquemp.com/',
          ),
        ];
        update();
      }

  }

  void fetchAppSupportLink() async {

    var apiClient = ApiClient();
    var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/app-support-links'));
    print('sdfsdsdds 333 ${response.statusCode}');
    if (response.statusCode == 200) {
      print('sdfsdsdds 1111');
      var jsonData = json.decode(response.body) as List<dynamic>;
      var socialLinkModelList = jsonData.map((item) => SocialLinkModel.fromJson(item)).toList();
      socialLinkModel.value = socialLinkModelList;
      update();
    }else{
      print('sdfsdsdds 999');
      socialLinkModel.value = [
        SocialLinkModel(
          id: 0,
          imageUrl:'https://i.ibb.co/CMr41kr/icons8-facebook-144.png',
          name: 'Facebook',
          phone: '',
          value: 'https://www.facebook.com/engrenamulhaquemp',
        ),
        SocialLinkModel(
          id: 0,
          imageUrl:'https://i.ibb.co/CQ0ccKZ/icons8-instagram-144.png',
          name: 'Instagram',
          phone: '',
          value: 'https://www.instagram.com/mp_enamulhaque/',
        ),

        SocialLinkModel(
          id: 0,
          imageUrl:'https://i.ibb.co/NTtnZJJ/icons8-youtube-144.png',
          name: 'Youtube',
          phone: '',
          value: 'https://enamulhaquemp.com/',
        ),SocialLinkModel(
          id: 0,
          imageUrl:'https://i.ibb.co/Jk219mM/icons8-internet-96.png',
          name: 'Web site',
          phone: '',
          value: 'https://enamulhaquemp.com/',
        ),
      ];
      update();
    }

  }

  void fetchMpEvents() async {
    try {
      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/events'));
      print('skgfsdjh 77 ${response.body}');
      if (response.statusCode == 200) {
        print('skgfsdjh 77 ${response.statusCode}');
        var jsonData = json.decode(response.body) as List<dynamic>;
        var esebahList = jsonData.map((item) => MpEventModel.fromJson(item)).toList();
        mpEventsList.value = esebahList;
        update();
      }
    } catch (e) {
      print('Error fetching sliders: $e');
    }
  }

  void fetchNotifications() async {
    try {
      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/notification'));
      print('skgfsdjh 77 ${response.body}');
      if (response.statusCode == 200) {
        print('skgfsdjh 77 ${response.statusCode}');
        var jsonData = json.decode(response.body) as List<dynamic>;
        var esebahList = jsonData.map((item) => NotiificationModel.fromJson(item)).toList();
        mNotiificationModel.value = esebahList;
        update();
      }
    } catch (e) {
      print('Error fetching sliders: $e');
    }
  }

  void fetchBagmaraAbout() async {
    try {
      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/bagmara_about'));
      print('skgfsdjh 77 ${response.body}');
      if (response.statusCode == 200) {
        print('skgfsdjh 77 ${response.statusCode}');
        var jsonData = json.decode(response.body) as List<dynamic>;
        var esebahList = jsonData.map((item) => BagmaraAboutModel.fromJson(item)).toList();
        mBagmaraAboutModel.value = esebahList;
        update();
      }
    } catch (e) {
      print('Error fetching sliders: $e');
    }
  }

  SettingsModel? settingsModel;

  Future<String> fetchSettings() async {

      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/getSettings'));
      print('skgfsdjh 77 ${response.body}');
      if (response.statusCode == 200) {
        print('skgfsdjh 77 ${response.statusCode}');

        var jsonData = json.decode(response.body) as List<dynamic>;
        print('fjhsjd ${jsonData}');
         settingsModel = SettingsModel.fromJson(jsonData[0]);
        update();
         return settingsModel!.appVersion!;

      }else{
        return '';
      }



  }

  void postToken(String deviceToken, String deviceName) async {
    try {
      final apiUrl = '${AppString.BASE_URL}/api/store_token'; // Replace with your API endpoint

      final Map<String, String> data = {
        'device_token': deviceToken,
        'device_name': deviceName,
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json', // Adjust the content type as needed
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // Token saved successfully
        print('Token saved successfully');
      } else {
        // Handle the error
        print('Token save failed: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Error saving token: $e');
    }
  }


  UserModel? userModel;

  Future<ResponseModel> fetchUserInfo(String reffer_code) async {

      var apiClient = ApiClient();
      var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/user-info/$reffer_code'));
      print('skgfsdjh 77 ${response.body}');
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        var user = responseData['user'];
        userModel = UserModel.fromJson(responseData);

        return ResponseModel(true, 'API call successful.');
      } else {
        print('Error: ${response.statusCode}');
        print('Error message: ${response.body}');
        return ResponseModel(false, 'API call failed: ${response.statusCode}');
      }

  }

}
