import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../components/home_card.dart';
import 'cardScrollview_model.dart';
import 'package:http/http.dart' as http;



Map? serverD;
List? decop;


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
    http.Response response;
    response = await http.get(Uri.parse("http://192.168.43.53:5000/api/linkedaccounts"));
    print(response);
    if(response.statusCode == 200){
      print("called");
      serverD = json.decode(response.body);
      decop = serverD?['data'];
      print(decop);
      setState(() {
        serverD = json.decode(response.body);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    print(decop?[1]["accountType"])  ;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
             decop?.length == null ? 0 : decop!.length,
              (index) => HomeCard(
            accountType: decop?[index]["accountType"].toString(),
            accountNumber: decop?[index]["accountNumber"].toString(),
            scanneedNumber: decop?[index]["total_no_scan"].toString(),
            TotalscanneedAmount: decop?[index]["accountType"].toString()
          ),
        ),
      ),
    );
  }
}

