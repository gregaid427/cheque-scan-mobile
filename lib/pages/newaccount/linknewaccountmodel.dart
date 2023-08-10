
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../auth/user.dart';

class CreateAccountModel {

  String? accountType;
  String? bank;
  String? accountName;
  String? accountNumber;

  //CreateAccountModel({this.phoneNumber1, this.name, this.password, this.email});

  Future LinkAccountService() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString("user_id");
    print(userid);

    print("create linked");
    final http.Response response = await http.post(
        Uri.parse('http://192.168.43.53:5000/api/linkedaccounts'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String?>{
          'accountsType': accountType,
          'bank': bank,
          'accountName': accountName,
          'accountNumber': accountNumber,
           "user_id": userid
        }));

    if(response.statusCode == 200) {
return   response.statusCode;  }
    if(response.statusCode != 200) {
    return  response.statusCode;
    }

    // if (result.code != Endpoints.AppSuccessCode) {
    //   showToast(result.msg);
    // }

  }


}
