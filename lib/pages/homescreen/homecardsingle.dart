import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/api_service.dart';
import 'datamodel.dart';
import 'home_screen.dart';
import 'homescreenviewmodel.dart';
import 'package:http/http.dart' as http;

Map? serverD;
List? data;
HomeScreeViewModel homeScreeViewModel = HomeScreeViewModel();

class SingleListItem extends StatefulWidget {
  const SingleListItem({
    Key? key,
    List? data,
  }) : super(key: key);

  @override
  State<SingleListItem> createState() => _SingleListItemState();
}

class _SingleListItemState extends State<SingleListItem> {
  void initState() {
    Apicall();
    super.initState();
  }

  Future Apicall() async {
    HomeScreeViewModel homeScreeViewModel = HomeScreeViewModel();
    data = await homeScreeViewModel.api();
    setState(() {
      data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: data == null
            ? Container(padding: EdgeInsets.symmetric(vertical: 20),
          child: const Text('Loading history...'),
              ):
        data?.isEmpty == true ? Container(padding: EdgeInsets.symmetric(vertical: 20),
          child: const Text('No transactions history'),
        )  : SingleChildScrollView(
                child: Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(), //<--here
                      itemCount: data == null ? 0 : data!.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return HistorySingleItem(
                          issuer: HomeScreeViewModel.Trimstring(
                              data?[index]['issuer']),
                          accountDeposited: HomeScreeViewModel.Trimstring(
                              data?[index]['scanAccntNo'].toString()),
                          amount: HomeScreeViewModel.Trimstring(
                              data?[index]['amount'].toString()),
                        );
                      }),
                ],
              )));
  }
}

class Transactions {
  String? amount;
  String? accountName;
  String? accountNumber;

  Transactions({required amount, required accountNumber, required accountName});
  // factory Transactions.fromMap(Map<String, dynamic> json) {
  //   return Transactions(
  //     json['account'],
  //     json['accountName'],
  //     json['accountNumber'],
  //   );
  // }

  // Transactions(this.amount, this.accountName, this.accountNumber);
  // factory Transactions.fromMap(Map<String, dynamic> json) {
  //   return Transactions(
  //     json['account'],
  //     json['accountName'],
  //     json['accountNumber'],
  //   );
  // }

  // List<Transactions> parseTransactions(String responseBody) {
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //   return parsed.map<Transactions>((json) =>Transactions.fromJson(json)).toList();
  // }
  // Future<List<Transactions>> fetchTransactions() async {
  //   final response = await http.get('http://192.168.1.2:8000/products.json');
  //   if (response.statusCode == 200) {
  //     return parseTransactions(response.body);
  //   } else {
  //     throw Exception('Unable to fetch products from the REST API');
  //   }
  // }
}
