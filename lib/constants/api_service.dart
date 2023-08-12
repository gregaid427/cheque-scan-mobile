import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/homescreen/datamodel.dart';


class ApiService {

 Future GetapiCall () async{
   http.Response response;
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   String? userid = prefs.getString("user_id");
   response = await http.get(Uri.parse("http://192.168.43.53:5000/api/transactions/$userid"));
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