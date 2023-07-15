
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateAccountModel {

  String? accountType;
  String? bank;
  String? accountName;
  String? accountNumber;

  //CreateAccountModel({this.phoneNumber1, this.name, this.password, this.email});

  Future LinkAccountService() async {
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
           "user_id": "5"
        }));

    if(response.statusCode == 200) {
      print('posted');
    }
    if(response.statusCode != 200) {
      print('not posted');
    }

    // if (result.code != Endpoints.AppSuccessCode) {
    //   showToast(result.msg);
    // }

  }


}
