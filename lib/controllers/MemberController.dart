
import 'package:get/get.dart';
import '../models/respons/MemberModel.dart';
import '../models/respons/responseModel.dart';
import '../utils/ApiClient.dart';
import '../utils/AppString.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:mime/mime.dart';
import 'package:flutter/foundation.dart' as Foundation;

class MemberController extends GetxController{

  List<MemberModel>? memberModel;

  @override
  void onInit() {
    super.onInit();
    // Fetch slider data from API or any other source
  }



  Future<ResponseModel> getMembers(String role, int executiveCommitteeId, int committeesId) async {
    Map<String, String> queryParams = {
      'role': role,
      'executive_committee_id':'$executiveCommitteeId',
      'committee_id':'$committeesId'
    };
    var apiClient = ApiClient();
    Uri uri = Uri.parse('${AppString.BASE_URL}/api/allUsers').replace(queryParameters: queryParams);
    var response = await apiClient.get(uri);

    print('xhvjkhxc ${response.request}');
    if (response.statusCode == 200) {
      memberModel = [];
      List<dynamic> jsonData = json.decode(response.body);
      jsonData.forEach((element) {
        MemberModel memberMode = MemberModel.fromJson(element);
        print('sdjhfs ${memberModel}');
        memberModel?.add(memberMode);
      });
      update();
      return ResponseModel(true, 'API call successful.');


    } else {
      // Error response
      print('Error: ${response.statusCode}');
      print(response.body);
      return ResponseModel(false, 'API call failed: ${response.statusCode}');
    }
  }





  List<MemberModel> parseUsersFromJson(List<dynamic> jsonData) {
    List<MemberModel> users = [];
    jsonData.forEach((userJson) {
      MemberModel user = MemberModel.fromJson(userJson);
      users.add(user);
    });
    return users;
  }


}