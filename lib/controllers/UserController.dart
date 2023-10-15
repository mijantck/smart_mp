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
import '../models/respons/AdminLoginModel.dart';
import '../models/respons/ErrorResponse.dart';
import '../models/respons/MemberModel.dart';
import '../models/respons/UserModel.dart';
import '../models/respons/responseModel.dart';
import '../utils/ApiClient.dart';
import 'package:image/image.dart' as img;


class UserController extends GetxController {

  UserModel? userModel;
  AdminLoginModel? adminLoginModel;


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
      }else if (response.statusCode == 202) {
        print('11111');
        var jsonData = json.decode(response.body);
        // Create and return the success response

        print('dsjhfkjsd ${jsonData}');

        // Map<String, dynamic> responseData = json.decode(response.body);
        // var user = responseData['user'];
        // var token = responseData['token'];
        // // userModel = UserModel.fromJson(responseData);
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString('token', token);
        // //prefs.setString('role', userModel!.user!.role!);

        update();
        return ResponseModel(false, 'API call successful.');
      } else {
        print('2222');
        return ResponseModel(false, 'API call failed: ${response.statusCode}');
      }
    } catch (e) {
      print('333');
      return ResponseModel(false, 'Error :$e');
    }
  }

  Future<ResponseModel> updateProfileImageMultipartData(List<MultipartBody> multipartBody,num id) async {
    try {
      var apiClient = ApiClient();
      var request = http.MultipartRequest('POST', Uri.parse('${AppString.BASE_URL}/api/users/$id/profile-image'));
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
      var streamedResponse = await apiClient.send(request);
      var response = await http.Response.fromStream(streamedResponse);

      print('ssgsgs ${response.body}');
      if (response.statusCode == 200) {
        print('11111');
        var jsonData = json.decode(response.body);
        update();
        return ResponseModel(true, 'API call successful.');
      }else if (response.statusCode == 202) {

        update();
        return ResponseModel(false, 'API call successful.');
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
      var token = responseData['token'];
      userModel = UserModel.fromJson(responseData);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(AppString.token, token);
      prefs.setString(AppString.role, userModel!.user!.role!);
      prefs.setString(AppString.userLoginType, AppString.general);

      prefs.setString(AppString.loginMobile, mobileNumber);
      prefs.setString(AppString.loginPassword, password);

      return ResponseModel(true, 'API call successful.');
    } else {
      print('Error message: ${response.body}');
      try {
        Map<String, dynamic> errorResponseData = json.decode(response.body);
        ErrorResponse errorResponse = ErrorResponse.fromJson(errorResponseData);
        String errorMessage = errorResponse.message;

        if (errorResponse.errors.containsKey('mobile_number')) {
          errorMessage = errorResponse.errors['mobile_number'][0];
        } else if (errorResponse.errors.containsKey('password')) {
          errorMessage = errorResponse.errors['password'][0];
        }

        return ResponseModel(false, errorMessage);
      } catch (e) {
        // If parsing the error response fails, return a generic error message
        return ResponseModel(false, 'API call failed: ${response.statusCode}');
      }
    }
  }



  Future<ResponseModel> updateUser(Map<String, String> body,String userId) async {

    String requestBodyJson = json.encode(body);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.post(
      Uri.parse('${AppString.BASE_URL}/api/users/$userId'),
      headers: headers,
      body: requestBodyJson,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      var token = responseData['token'];
      userModel = UserModel.fromJson(responseData);
      print('dshkfjsdh ${responseData}');

      return ResponseModel(true, 'API call successful.');
    } else {
      print('Error message: ${response.body}');
      try {
        Map<String, dynamic> errorResponseData = json.decode(response.body);
        ErrorResponse errorResponse = ErrorResponse.fromJson(errorResponseData);
        String errorMessage = errorResponse.message;

        return ResponseModel(false, errorMessage);
      } catch (e) {
        // If parsing the error response fails, return a generic error message
        return ResponseModel(false, 'API call failed: ${response.statusCode}');
      }
    }
  }


  Future<ResponseModel> loginUserAdmin(String email, String password) async {
    Map<String, dynamic> requestData = {
      'email': email,
      'password': password,
    };
    String requestBodyJson = json.encode(requestData);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.post(
      Uri.parse('${AppString.BASE_URL}/api/admin-login'),
      headers: headers,
      body: requestBodyJson,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      adminLoginModel = AdminLoginModel.fromJson(responseData);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(AppString.token, AppString.admin);
      prefs.setString(AppString.userLoginType, AppString.admin);
      prefs.setString(AppString.loginEmail, email);
      prefs.setString(AppString.loginPassword, password);

      return ResponseModel(true, 'API call successful.');
    } else {
      print('Error message: ${response.body}');
      try {
        Map<String, dynamic> errorResponseData = json.decode(response.body);
        String errorMessage = errorResponseData['error'];
        return ResponseModel(false, errorMessage);

      } catch (e) {
        // If parsing the error response fails, return a generic error message
        return ResponseModel(false, 'API call failed: ${response.statusCode}');
      }
    }
  }

  Future<ResponseModel> sendOtp(String mobileNumber) async {


    Map<String, dynamic> requestData = {
      'mobile_number': mobileNumber,
    };
    String requestBodyJson = json.encode(requestData);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.post(
      Uri.parse('${AppString.BASE_URL}/api/send-otp'),
      headers: headers,
      body: requestBodyJson,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);

      var otp = responseData['otp'];
      return ResponseModel(true, otp);
    } else {
      print('Error message: ${response.body}');
      try {
        Map<String, dynamic> errorResponseData = json.decode(response.body);

        var errorMessage = errorResponseData['errorMessage'];
        return ResponseModel(false, errorMessage);
      } catch (e) {
        // If parsing the error response fails, return a generic error message
        return ResponseModel(false, 'API call failed: ${response.statusCode}');
      }
    }
  }


  Future<ResponseModel> changePasswordOtp(String mobileNumber,String new_password,String confirm_password,) async {


    Map<String, dynamic> requestData = {
      'mobile_number': mobileNumber,
      'new_password': new_password,
      'confirm_password': confirm_password,
    };
    String requestBodyJson = json.encode(requestData);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.post(
      Uri.parse('${AppString.BASE_URL}/api/change-password-otp'),
      headers: headers,
      body: requestBodyJson,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      var sMessage = responseData['sMessage'];

      return ResponseModel(true, sMessage);

    } else {
      print('Error message: ${response.body}');
      try {
        Map<String, dynamic> errorResponseData = json.decode(response.body);
        ErrorResponse errorResponse = ErrorResponse.fromJson(errorResponseData);
        String errorMessage = errorResponse.message;

        if (errorResponse.errors.containsKey('confirm_password')) {
          errorMessage = errorResponse.errors['confirm_password'][0];
        } else if (errorResponse.errors.containsKey('password')) {
          errorMessage = errorResponse.errors['password'][0];
        }

        return ResponseModel(false, errorMessage);
      } catch (e) {
        // If parsing the error response fails, return a generic error message
        return ResponseModel(false, 'API call failed: ${response.statusCode}');
      }
    }
  }



  Future<ResponseModel> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer ${token}'
    };
    var response = await http.get(
      Uri.parse('${AppString.BASE_URL}/api/getAppUser'),
      headers: headers,
    );

    print('dhsjfhds ${response.body}');

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      userModel = UserModel.fromJson(responseData);

      return ResponseModel(true, 'API call successful.');
    } else {
      print('Error message: ${response.body}');
      try {
        Map<String, dynamic> errorResponseData = json.decode(response.body);
        ErrorResponse errorResponse = ErrorResponse.fromJson(errorResponseData);
        String errorMessage = errorResponse.message;

        if (errorResponse.errors.containsKey('mobile_number')) {
          errorMessage = errorResponse.errors['mobile_number'][0];
        } else if (errorResponse.errors.containsKey('password')) {
          errorMessage = errorResponse.errors['password'][0];
        }

        return ResponseModel(false, errorMessage);
      } catch (e) {
        // If parsing the error response fails, return a generic error message
        return ResponseModel(false, 'API call failed: ${response.statusCode}');
      }
    }


  }







  int currentPage = 1;
  int totalUsers = 0;
  int totalPages = 1; // Initialize to 1 initially
  String next_page_url = '';
  var userListModelData = [];
  bool isSearchFunction = false;
  Future<void> fetchVoterList(int page,String user_type) async {
    isSearchFunction = false;

    String urlMain = '${AppString.BASE_URL}/api/users-lists?user_type=$user_type&page=$page';
    if(page != 1){
      urlMain = next_page_url;
    }

    var apiClient = ApiClient();
    var response = await apiClient.get(Uri.parse(urlMain));
    if (response.statusCode == 200) {
      if(page == 1){
        userListModelData = [];
      }

      print('hgjkd   ${response.body} ');

      Map<String, dynamic> responseData = json.decode(response.body);
      var userListModel = responseData['userList']['data'];

      var userListModelDataFull = userListModel.map((item) => User.fromJson(item)).toList();
      userListModelData.addAll(userListModelDataFull);

      totalUsers = responseData['userList']['total'];
      currentPage = responseData['userList']['current_page'];
      totalPages = responseData['userList']['last_page'];
      next_page_url = responseData['userList']['next_page_url']??'';

      print('jhsdkf $totalUsers $currentPage   $totalPages');
      update();
    }
  }
  Future<void> fetchSearchingList(int page, String queryString,String user_type) async {

    isSearchFunction = true;
    var urlMain = '${AppString.BASE_URL}/api/users-lists/search?user_type=$user_type$queryString&page=$page';
    if(page != 1){
      urlMain = next_page_url;
      print('dhsjf ${urlMain}');
    }


    var apiClient = ApiClient();
    var response = await apiClient.get(Uri.parse(urlMain));

    print('oiweroewp ${response.body}');

    if (response.statusCode == 200) {
      if(page == 1){
        userListModelData = [];
      }

      Map<String, dynamic> responseData = json.decode(response.body);
      var userListModel = responseData['userList']['data'];

      var userListModelDataFull = userListModel.map((item) => User.fromJson(item)).toList();
      userListModelData.addAll(userListModelDataFull);

     // totalUsers = responseData['totalUsers'];
      totalUsers = responseData['userList']['total'];
      currentPage = responseData['userList']['current_page'];
      totalPages = responseData['userList']['last_page'];
      next_page_url = responseData['userList']['next_page_url']??'';
      print('dfsdfsd $totalUsers $currentPage   $totalPages $next_page_url');
      update();
    }
  }
  // Add a method to load the next page
  Future<void> loadNextPage(String user_type) async {

    if(isSearchFunction){
      if (currentPage < totalPages) {
        currentPage++;
        await fetchSearchingList(currentPage,'',user_type);
      }
    }else{
      if (currentPage < totalPages) {
        currentPage++;
        await fetchVoterList(currentPage,user_type);
      }
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
