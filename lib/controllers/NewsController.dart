import 'package:get/get.dart';
import 'package:smart_mp/models/respons/NewModel.dart';
import '../utils/AppString.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsController extends GetxController{


  List<NewModel>? newsList;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }


  void fetchNews() async {
    print('sjhfsdjkfh 1');
    try {
      print('sjhfsdjkfh 2');
      var response = await http.get(Uri.parse('${AppString.BASE_URL}/api/get-news'));
      newsList = [];
      print('sjhfsdjkfh 3');
      if (response.statusCode == 200) {
        print('sjhfsdjkfh 3');
        var jsonData = json.decode(response.body) as List<dynamic>;
        var tempList = jsonData.map((item) => NewModel.fromJson(item)).toList();
        newsList = tempList; // Assign the tempList to newsList
        print('djshfkjsd ${newsList!.length}');
        update();
      }
    } catch (e) {
      print('sjhfsdjkfh 4');
      print('Error fetching sliders: $e');
    }
  }
}