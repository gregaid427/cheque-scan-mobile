import 'dart:convert';

import 'package:cheque_scan/auth/shared_preference.dart';
import 'package:cheque_scan/auth/user.dart';
import 'package:dio/dio.dart';

import '../constants/app_url.dart';
//import 'package:loginradius_example/core/constants.dart';
//var accesstoken =  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOiIyNzdAZ21haWwuY29tIiwiaWF0IjoxNjg5ODU1MDU4fQ.RH7fiMmCUk5wqz7RHzeuifoK96PrKCa4BJZPP3smCBo'

class ApiClient {
  final Dio _dio = Dio();
  AppUrl appUrl = new AppUrl();
  Future<dynamic> registerUser(Map<String, dynamic>? data) async {
    try {
      print(data);
      Response response = await _dio.post(
        AppUrl.register,
          data: data,
        //  queryParameters: {'apikey': ApiSecret.apiKey},
        //  options: Options(headers: {'X-LoginRadius-Sott': ApiSecret.sott})
           )
           ;
      return response.data;
    } on DioError catch (e) {
      return "Connection Error";
    }
  }

  Future<dynamic> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        AppUrl.login,
        data: {
          'email': email,
          'password': password,
        },

        // queryParameters: {'apikey': ApiSecret.apiKey},
      );
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      return 'conn err';
    }
  }

  Future<dynamic> getUserProfileData(String accessToken,String userId) async {
    try {
      Response response = await _dio.get(
        AppUrl.getuserprofilebyid+'$userId',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
//////
//       final Map<String, dynamic> responseData = json.decode(response.data);
//       var userData = responseData['data'];
//       User authUser = User.fromJson(userData);
//       //persist data
//       final UserPreferences _userPreferences = UserPreferences();
//       _userPreferences.saveUser(authUser);

print('response');
print(response.data);
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
  Future<dynamic> updateUserProfile({
    required String accessToken,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await _dio.put(
        'https://api.loginradius.com/identity/v2/auth/account',
        data: data,
     //   queryParameters: {'apikey': ApiSecret.apiKey},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> logout(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/access_token/InValidate',
    //    queryParameters: {'apikey': ApiSecret.apiKey},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
