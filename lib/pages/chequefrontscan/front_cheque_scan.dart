import 'package:cheque_scan/components/%20custom_appbar.dart';
import 'package:cheque_scan/components/rounded_button.dart';
import 'package:cheque_scan/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FrontChequeScan extends StatefulWidget {
  const FrontChequeScan({Key? key}) : super(key: key);

  @override
  State<FrontChequeScan> createState() => _FrontChequeScanState();
}

class _FrontChequeScanState extends State<FrontChequeScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(),
          Expanded( flex: 5, child: Container( color: Colors.orangeAccent,)),
          const Expanded(flex: 2, child: Center(child: RoundedButton(title: 'Continue', backgroundColor: kPrimaryColor,color: Colors.white,)))


        ],
      ),
    );
  }
}
