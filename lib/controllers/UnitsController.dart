import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_mp/models/respons/ESebahModel.dart';
import 'package:smart_mp/models/respons/MpEventModel.dart';
import 'dart:convert';

import 'package:smart_mp/utils/AppString.dart';
import '../models/respons/DestinationCitizan.dart';
import '../models/respons/DestinationParty.dart';
import '../models/respons/ExecutiveCommittee.dart';
import '../models/respons/SliderModel.dart';
import '../models/respons/Union.dart';
import '../models/respons/Unit.dart';
import '../models/respons/Upazila.dart';
import '../models/respons/committee.dart';
import '../utils/ApiClient.dart';


class UtilsController extends GetxController {

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
  var mpEventsList = <MpEventModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch slider data from API or any other source
    fetchCommittees();
    fetchExecutiveCommittee();
    fetchDestinationParty();
    fetchDestinationCitizan();
    fetchUnion();
    fetchUnit();
    fetchUpazila();
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


}