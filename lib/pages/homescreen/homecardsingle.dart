import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../constants/api_service.dart';
import 'datamodel.dart';
import 'home_screen.dart';
import 'homescreenviewmodel.dart';
import 'package:http/http.dart' as http;


Map? serverD;
List? decop;
HomeScreeViewModel homeScreeViewModel = new HomeScreeViewModel();

class SingleListItem extends StatefulWidget {
  const SingleListItem({
    Key? key, List? data,
  }) : super(key: key);

  @override
  State<SingleListItem> createState() => _SingleListItemState();

}
List Translist = [];
List Translist1 = [];





class _SingleListItemState extends State<SingleListItem> {

  void initState() {
    Apicall();
    super.initState();
  }

  Future Apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("http://192.168.43.53:5000/api/Transactions/5"));
    print(response);
    if(response.statusCode == 200){
      print("called");
      serverD = json.decode(response.body);
      decop = serverD?['data'];

      setState(() {
        serverD = json.decode(response.body);
      });
    }
    print(serverD);
  }


  @override

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: decop == null ? Container(child: const Text('No transactions history'),) : SingleChildScrollView(
        child:  Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(), //<--here
                itemCount: decop == null ? 0 : decop!.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
      return HistorySingleItem(
            issuer:
          HomeScreeViewModel.Trimstring(decop?[index]['accountName']),
            accountDeposited: HomeScreeViewModel.Trimstring(
                decop?[index]['accountNumber'].toString()),
            amount: HomeScreeViewModel.Trimstring(
                decop?[index]['amount'].toString()),
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

  Transactions(  {required amount, required accountNumber, required accountName});
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


