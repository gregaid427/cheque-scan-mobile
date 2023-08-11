import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/home_card.dart';
import 'cardScrollview_model.dart';
import 'package:http/http.dart' as http;



Map? serverD;
List? data;
bool? load = false;

class CardScrollView extends StatefulWidget {
  CardScrollView({
    Key? key,
  }) : super(key: key);


  List? cardItems;

  @override
  State<CardScrollView> createState() => _CardScrollViewState();
}

CardScrollViewModel _cardScrollViewModel = CardScrollViewModel();
List? result;
class _CardScrollViewState extends State<CardScrollView> {
  void initState() {
    Apicall();
    super.initState();
  }

  Future Apicall() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString("user_id");

    http.Response response;
    response = await http.get(Uri.parse("http://192.168.43.53:5000/api/linkedaccounts/$userid"));
    print(response);
    if(response.statusCode == 200){
      serverD = json.decode(response.body);
      data = serverD?['data'];
      print(serverD?['data']);
      setState(() {
        load = true;
        serverD = json.decode(response.body);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
  //  print(data?[1]["accountType"])  ;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
             data?.length == null ? 0 : data!.length,
              (index) => data?.isEmpty != true ? HomeCard(
            accountType: data?.length == null ? '' : data?[index]["accountType"].toString(),
            accountNumber: data?.length == null ? '' : data?[index]["accountNumber"].toString(),
            scanneedNumber: data?.length == null ? '' :  data?[index]["total_no_scan"].toString(),
            TotalscanneedAmount: data?.length == null ? '' : data?[index]["total_no_scan"].toString()

        ):   HomeCardEmpty(),
        ),
      ),
    );
  }
}

class HomeCardEmpty extends StatelessWidget {
  const HomeCardEmpty(
      {Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 140,
        width: 320,
        margin: EdgeInsets.symmetric(horizontal: 0),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.orange),
        child:  Center(  child:  load != true ?  CircularProgressIndicator() : Text('No linked accounts', style: TextStyle(fontSize: 17, color: Colors.white),)
        ),
      ),
    );
  }
}
