
import 'package:get/get.dart';
import 'package:smart_mp/models/respons/UserModel.dart';
import '../models/respons/MemberModel.dart';
import '../models/respons/responseModel.dart';
import '../utils/ApiClient.dart';
import '../utils/AppString.dart';
import 'dart:convert';
import 'dart:async';


class MemberController extends GetxController{

  List<User>? memberModel;

  @override
  void onInit() {
    super.onInit();
    // Fetch slider data from API or any other source
  }



  Future<ResponseModel> getMembers(String role, int executiveCommitteeId,{int committeesId = 0,int designation_party_id = 0,int ward_no = 0, int union_id = 0}) async {
    Map<String, String> queryParams = {
      'role': role,
      'executive_committee_id':'$executiveCommitteeId',
      'committee_id':'${committeesId == 0 ?'':committeesId}',
      'designation_party_id':'${designation_party_id == 0 ?'':designation_party_id}',
      'union_id':'${union_id == 0 ?'':union_id}',
      'ward_no':'${ward_no == 0 ? '':ward_no}',
    };
    var apiClient = ApiClient();
    Uri uri = Uri.parse('${AppString.BASE_URL}/api/allUsers').replace(queryParameters: queryParams);
    var response = await apiClient.get(uri);

    print('xhvjkhxc ${response.request}');
    if (response.statusCode == 200) {
      memberModel = [];
      List<dynamic> jsonData = json.decode(response.body);
      jsonData.forEach((element) {
        User memberMode = User.fromJson(element);
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





  List<User> parseUsersFromJson(List<dynamic> jsonData) {
    List<User> users = [];
    jsonData.forEach((userJson) {
      User user = User.fromJson(userJson);
      users.add(user);
    });
    return users;
  }


}