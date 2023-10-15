



import 'package:get/get.dart';
import 'package:smart_mp/models/respons/VoterListModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_mp/models/respons/ESebahModel.dart';
import 'package:smart_mp/models/respons/MpEventModel.dart';
import 'dart:convert';
import '../utils/ApiClient.dart';
import '../utils/AppString.dart';



class VoterListController extends GetxController{

  VoterListModel? voterListModel;
  int currentPage = 1;
  int totalPages = 1; // Initialize to 1 initially
  int totalUsers = 0;
  String next_page_url = '';
  bool isSearchFunction = false;
  var voterListModelData = [];

  Future<void> fetchVoterList(int page) async {

    isSearchFunction = true;
    var urlMain = '${AppString.BASE_URL}/api/voter-lists?page=$page';
    if(page != 1){
      urlMain = next_page_url;
      print('dhsjf ${urlMain}');
    }

    var apiClient = ApiClient();
    var response = await apiClient.get(Uri.parse(urlMain));

    if (response.statusCode == 200) {
      if(page == 1){
        voterListModelData = [];
      }

      Map<String, dynamic> responseData = json.decode(response.body);
      var voterListModel = responseData['voterLists']['data'];

      var voterListModelDataFull = voterListModel.map((item) => VoterListModelData.fromJson(item)).toList();
      voterListModelData.addAll(voterListModelDataFull);

      currentPage = responseData['voterLists']['current_page'];
      totalPages = responseData['voterLists']['last_page'];
      next_page_url = responseData['voterLists']['next_page_url']??'';
      totalUsers = responseData['voterLists']['total'];
      print('jhsdkf $currentPage   $totalPages');
      update();
    }
  }
  Future<void> fetchSearchingList(int page, String queryString,String voterType) async {

    //var url = '${AppString.BASE_URL}/api/voter-lists/search?nid=$nid&voter_type=$voterType';

    isSearchFunction = true;
    var urlMain = '${AppString.BASE_URL}/api/voter-lists/search?voter_type=$voterType$queryString&page=$page';
    if(page != 1){
      urlMain = next_page_url;
      print('dhsjf ${urlMain}');
    }

    var apiClient = ApiClient();
    var response = await apiClient.get(Uri.parse(urlMain));

    print('sdfsdhj ${response.body}');

    if (response.statusCode == 200) {
      if(page == 1){
        voterListModelData = [];
      }


      Map<String, dynamic> responseData = json.decode(response.body);
      var voterListModel = responseData['voterLists']['data'];

      var voterListModelDataFull = voterListModel.map((item) => VoterListModelData.fromJson(item)).toList();
      voterListModelData.addAll(voterListModelDataFull);

      currentPage = responseData['voterLists']['current_page'];
      totalPages = responseData['voterLists']['last_page'];
      next_page_url = responseData['voterLists']['next_page_url']??'';
      totalUsers = responseData['voterLists']['total'];
      update();
    }
  }
  // Add a method to load the next page
  Future<void> loadNextPage() async {

    if(isSearchFunction){
      if (currentPage < totalPages) {
        currentPage++;
        await fetchSearchingList(currentPage,'','new');
      }
    }else{
      if (currentPage < totalPages) {
        currentPage++;
        await fetchVoterList(currentPage);
      }
    }

  }
}
