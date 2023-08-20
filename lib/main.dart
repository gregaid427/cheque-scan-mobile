import 'package:cheque_scan/pages/authentication/otp/otp_screen.dart';
import 'package:cheque_scan/pages/authentication/sign_in/signin_screen.dart';
import 'package:cheque_scan/pages/chequebackscan/back_cheque_scan.dart';
import 'package:cheque_scan/pages/chequefrontscan/front_cheque_scan.dart';
import 'package:cheque_scan/pages/homescreen/home_screen.dart';
import 'package:cheque_scan/pages/introduction_view.dart';
import 'package:cheque_scan/pages/newaccount/link_new_account.dart';
//import 'package:cheque_scan/pages/transactions/transactions_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/shared_preference.dart';
import 'core/provider/Transactionsdata.dart';

int? status;

Future<void> main() async {


  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TransactionsData>(
        create: (BuildContext context) => TransactionsData()),
  ], child: const MyApp()));

  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // status =   prefs.getInt('userAppStatus');

}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

gett() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  status =   prefs.getInt('userAppStatus');
  print(status);

}

  void initState() {
    //getUserStatus();
  //  CheckUserAppStatus();
    gett();
    print(status);
    super.initState();
  }
 // Widget CheckUserAppStatus() {
 //
 //   print(status);
 //   if(status == 2)
 //    return page = HomeScreen();
 //   if(status == 1)
 //    return page = OtpScreen();
 //   //if(status == null)
 //    return page = LoginScreen();
 // }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(status);

    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    // home:OtpScreen(),
      home: SafeArea(child:  status == 1 ? OtpScreen()  :  LoginScreen()),
        builder: EasyLoading.init(),
    );

  }
}

