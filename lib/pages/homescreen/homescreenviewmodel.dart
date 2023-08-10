

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:convert';
import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreeViewModel {

  api() async{
    http.Response response;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString("user_id");
    response = await http.get(Uri.parse("http://192.168.43.53:5000/api/scan/$userid"));
    List? data;
    if(response.statusCode == 200){
      var serverData = json.decode(response.body);
      data = serverData?['data'];
      print(data);
      return data;
    }
    else{
      return 'error';
    }
  }


  static String Trimstring(string) {
   if (string == null) {
     return "";
   }
    if (string.length < 16) {
      return string;
    } else {
      String text = string.substring(0, 16) + '.';
      return text;
    }
  }

 static List<Map<String, dynamic>> historyItems = [
   {
     "issuer": "ID ventures",
     "account": "2467 4534 4532 6654",
     "amount": "2500,000.00",
   },
   {
     "issuer": "Greory Aidoo Richardson",
     "account": "2467 4534 4532 6654",
     "amount": "1,025.00",
   },
   {
     "issuer": "Yestech Ghana Incorporated",
     "account": "2467 4534 4532 6654",
     "amount": "1,800,025.00",
   },
   {
     "issuer": "Yestech Ghana Incorporated",
     "account": "2467 4534 4532 6654",
     "amount": "1,800,025.00",
   },
   {
     "issuer": "Yestech Ghana Incorporated",
     "account": "2467 4534 4532 6654",
     "amount": "1,800,025.00",
   },
 ];


}


