import 'package:cheque_scan/pages/homescreen/home_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/user.dart';
import '../../components/ custom_appbar.dart';
import '../../components/rounded_button.dart';
import '../../constants/constants.dart';
import '../../constants/pagetransitions.dart';
import '../../core/provider/Transactionsdata.dart';
import '../chequebackscan/back_cheque_scan_model.dart';

String name = "";
String user_id = "";

BackscanModel backscanModel = new BackscanModel();

class TransactionsPreviewScreen extends StatefulWidget {
  const TransactionsPreviewScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsPreviewScreen> createState() =>
      _TransactionsPreviewScreenState();
}

class _TransactionsPreviewScreenState extends State<TransactionsPreviewScreen> {
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? firstName = prefs.getString("firstName");
    String? otherName = prefs.getString("otherName");
    String? lastName = prefs.getString("lastName");
    String? userid = prefs.getString("user_id");

    setState(() {
      name = "$firstName $otherName $lastName";
      user_id =  userid!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppbar(),
            const Expanded(
                child: Text('Transaction Preview', style: kTitleStyle)),
            Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Cheque Issuer',
                                style: TextStyle(
                                    color: Colors.deepOrange.shade400,
                                    fontSize: 20)),
                            const SizedBox(height: 13),
                            const Text('Name :',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 17)),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Bank :',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 17)),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Account Number :',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 17)),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Cheque Depositor',
                                style: TextStyle(
                                    color: Colors.deepOrange.shade400,
                                    fontSize: 20)),
                            const SizedBox(height: 13),
                            Row(
                              children: [
                                const Text('Name :  ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17)),
                                Text(
                                  name,
                                  style: TextStyle(
                                      color: Colors.deepOrange.shade400,
                                      fontSize: 19),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text('Account Type :  ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17)),
                                Text(
                                  Provider.of<TransactionsData>(context)
                                      .getaccountType,
                                  style: TextStyle(
                                      color: Colors.deepOrange.shade400,
                                      fontSize: 19),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text('Bank :  ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17)),
                                Text(
                                  Provider.of<TransactionsData>(context)
                                      .getbank,
                                  style: TextStyle(
                                      color: Colors.deepOrange.shade400,
                                      fontSize: 19),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text('Account Number :  ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17)),
                                Text(
                                  Provider.of<TransactionsData>(context)
                                      .getchosenAccount,
                                  style: TextStyle(
                                      color: Colors.deepOrange.shade400,
                                      fontSize: 19),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Amount',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 17)),
                            const SizedBox(height: 13),
                            Text('GHS 13,000,000.00',
                                style: TextStyle(
                                    color: Colors.deepOrange.shade400,
                                    fontSize: 20)),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                      child: Row(
                    children: [
                      CancelButton(),
                      SizedBox(
                        width: 20,
                      ),
                      ConfimButton(),
                    ],
                  )),
                ))
          ],
        ),
      ),
    );
  }
}

class ConfimButton extends StatefulWidget {
  const ConfimButton({
    Key? key,
  }) : super(key: key);

  @override
  State<ConfimButton> createState() => _ConfimButtonState();
}

class _ConfimButtonState extends State<ConfimButton> {
  SuccessAlert() {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      title: 'Completed successfully!',
      // text: 'Completed successfully!',
      barrierDismissible: true,
      confirmBtnText: 'Ok',
      // widget:
      closeOnConfirmBtnTap: false,
      onConfirmBtnTap: () async {
        Navigator.pushReplacement(
          context,
          SlideTransition1(
            HomeScreen(),
          ),
        );
        // await Future.delayed(const Duration(milliseconds: 500), () async {
        //   await CoolAlert.show(
        //     context: context,
        //     type: CoolAlertType.success,
        //     text: "Phone number '$message' has been saved!.",
        //   );
        // });
      },
    );
  }

  ErrorAlert() {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      title: 'Error!',
      text: 'Sorry, something went wrong, Try again',
      loopAnimation: false,
    );
  }



  @override
  Widget build(BuildContext context) {
    User user = new User() ;

    String? frontLink =
        Provider.of<TransactionsData>(context, listen: false).getfrontImagelink;
    String? backLink =
        Provider.of<TransactionsData>(context, listen: false).getbackImagelink;
    String? scanAccntNo = "123456789-875-63";
    String? scanBankNo = "123456789-875-63";



    EmptyFields(){

      Provider.of<TransactionsData>(context, listen: false).setFieldsEmpty();

      print('Fields are emptied');

    }
    return Expanded(
      child: InkWell(
        onTap: () async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          String? userid = prefs.getString("user_id");
          int? response = await backscanModel.uploadImage(
              imagefront: frontLink,
              imageback: backLink,
              user_id: userid,
              scanAccntNo: scanAccntNo,
              amount: '23,000',
              account_id: '23,000',


              scanBankNo: scanBankNo);
          if (response == 200) {
            SuccessAlert();
            EmptyFields();
          } else {
            ErrorAlert();
          }
        },
        child: Container(
          // color: kPrimaryGradientColor,
          height: 50,
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(30)),
          //   padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: const Center(
              child: Text(
            "Confirm",
            style: TextStyle(fontSize: 25, color: Colors.white),
          )),
        ),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {

          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (_) => HomeScreen(),
            ),
          );
        },
        child: Container(
          height: 50,
          // color: kPrimaryGradientColor,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.deepOrange, width: 2)),

          // padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: const Center(
              child: Text(
            "Cancel",
            style: TextStyle(fontSize: 25, color: Colors.deepOrange),
          )),
        ),
      ),
    );
  }
}
