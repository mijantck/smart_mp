
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smart_mp/utils/AppString.dart';
import '../models/respons/SliderModel.dart';


class SliderController extends GetxController {

  var sliders = <SliderModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch slider data from API or any other source
    fetchSliders();
  }


  void fetchSliders() async {
    try {
      var response = await http.get(Uri.parse('${AppString.BASE_URL}/api/sliders'));
      print('fjdafdsdkhf ${response.body} 111');
      if (response.statusCode == 200) {
        // Parse the JSON data into a List<SliderModel>
        var jsonData = json.decode(response.body) as List<dynamic>;
        var sliderList = jsonData.map((item) => SliderModel.fromJson(item)).toList();
        // Assign the list of SliderModel objects to sliders
        sliders.value = sliderList;
        print('fjdafdsdkhf ${sliders.value} 222');
        update();
      }
    } catch (e) {
      print('Error fetching sliders: $e');
    }
  }

}
