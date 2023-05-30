import 'package:cheque_scan/components/%20custom_appbar.dart';
import 'package:cheque_scan/components/rounded_button.dart';
import 'package:cheque_scan/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackChequeScan extends StatefulWidget {
  const BackChequeScan({Key? key}) : super(key: key);

  @override
  State<BackChequeScan> createState() => _BackChequeScanState();
}

class _BackChequeScanState extends State<BackChequeScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(),
          Expanded( flex: 3, child: Container( child: Column(children: const [
            // Text('Deposit Cheque' ,style: kTitleStyle)


          ],),)),
          Expanded( flex: 6, child: Container( child: Column( children:  [
            const Align( alignment: Alignment.center,  child: Text('Please endorse and scan back of ',style: kTitleStyle,)),
            const Align( alignment: Alignment.center,  child: Text(' cheque',style: kTitleStyle,)),
            Align( alignment: Alignment.center,  child: Text('( Endorse with signature and date )',style: kTitleStyle1,))
          ],),)),
          const Expanded(flex: 1, child: Center(child: RoundedButton(title: 'Continue', backgroundColor: kPrimaryColor,color: Colors.white,)))
        ],
      ),
    );
  }
}
