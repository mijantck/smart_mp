import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_mp/utils/AppString.dart';
import '../models/requste/UserRegistation.dart';
import '../models/respons/MemberModel.dart';
import '../models/respons/UserModel.dart';
import '../models/respons/responseModel.dart';
import '../utils/ApiClient.dart';
import 'package:image/image.dart' as img;


class UserController extends GetxController {

  UserModel? userModel;

  Future<ResponseModel> postMultipartData(Map<String, String> body, List<MultipartBody> multipartBody) async {
    try {
      var apiClient = ApiClient();
      var request = http.MultipartRequest('POST', Uri.parse('${AppString.BASE_URL}/api/register'));
      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          File imageFile = File(multipart.file.path);
          Uint8List _list = await compressImage(imageFile); // Compress the image
          request.files.add(http.MultipartFile.fromBytes(
            multipart.key,
            _list,
            filename: multipart.fileName,
            contentType: MediaType('image', 'jpeg'),
          ));
        }
      }

      request.fields.addAll(body);
      var streamedResponse = await apiClient.send(request);
      var response = await http.Response.fromStream(streamedResponse);

      print('ssgsgs ${response.body}');
      if (response.statusCode == 201) {
        print('11111');
        var jsonData = json.decode(response.body);
        // Create and return the success response

        Map<String, dynamic> responseData = json.decode(response.body);
        var user = responseData['user'];
        var token = responseData['token'];
       // userModel = UserModel.fromJson(responseData);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        //prefs.setString('role', userModel!.user!.role!);

        update();
        return ResponseModel(true, 'API call successful.');
      } else {
        print('2222');
        return ResponseModel(false, 'API call failed: ${response.statusCode}');
      }
    } catch (e) {
      print('333');
      return ResponseModel(false, 'Error :$e');
    }
  }


  Future<ResponseModel> loginUser(String mobileNumber, String password) async {


    Map<String, dynamic> requestData = {
      'mobile_number': mobileNumber,
      'password': password,
    };
    String requestBodyJson = json.encode(requestData);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.post(
      Uri.parse('${AppString.BASE_URL}/api/login'),
      headers: headers,
      body: requestBodyJson,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      var user = responseData['user'];
      var token = responseData['token'];
      userModel = UserModel.fromJson(responseData);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setString('role', userModel!.user!.role!);

      return ResponseModel(true, 'API call successful.');
    } else {
      print('Error: ${response.statusCode}');
      print('Error message: ${response.body}');
      return ResponseModel(false, 'API call failed: ${response.statusCode}');
    }

    try {

    } catch (e) {
      print('Error: $e');
      return ResponseModel(false, 'Error :$e');
    }
  }

  Future<Uint8List> compressImage(File imageFile) async {
    final originalBytes = await imageFile.readAsBytes();
    final compressedImage = img.decodeImage(originalBytes)!; // Use the `img` package

    // Compress the image while maintaining a certain quality
    final compressedBytes = img.encodeJpg(compressedImage, quality: 80); // Adjust quality as needed

    return Uint8List.fromList(compressedBytes);
  }

}
class MultipartBody {
  String key;
  XFile file;
  String fileName;
  MultipartBody({required this.key, required this.file, required this.fileName});
}
