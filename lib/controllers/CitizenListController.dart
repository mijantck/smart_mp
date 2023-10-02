



import 'package:get/get.dart';
import 'package:smart_mp/models/respons/VoterListModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_mp/models/respons/ESebahModel.dart';
import 'package:smart_mp/models/respons/MpEventModel.dart';
import 'dart:convert';
import '../utils/ApiClient.dart';
import '../utils/AppString.dart';



class CitizenListController extends GetxController{

  VoterListModel? voterListModel;
  int currentPage = 1;
  int totalPages = 1; // Initialize to 1 initially

  var voterListModelData = [];

  Future<void> fetchUserQureList(int page) async {
    var apiClient = ApiClient();
    var response = await apiClient.get(Uri.parse('${AppString.BASE_URL}/api/voter-lists?page=$page'));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      var voterListModel = responseData['voterLists']['data'];

      var voterListModelDataFull = voterListModel.map((item) => VoterListModelData.fromJson(item)).toList();
      voterListModelData.addAll(voterListModelDataFull);

      currentPage = responseData['voterLists']['current_page'];
      totalPages = responseData['voterLists']['last_page'];
      print('jhsdkf $currentPage   $totalPages');
      update();
    }
  }





  // Add a method to load the next page
  Future<void> loadNextPage() async {
    if (currentPage < totalPages) {
      currentPage++;
      await fetchUserQureList(currentPage);
    }
  }
}
