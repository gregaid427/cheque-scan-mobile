import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../pages/homescreen/datamodel.dart';

List gop = [];
class ApiService {














  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse("http://192.168.43.53:5000/api/transactions");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print("jdkufhskdfhhdf");

       // print(response.body);
        List<UserModel> _model = userModelFromJson(response.body);
         print(_model);

        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}