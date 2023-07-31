import 'package:cheque_scan/pages/authentication/sign_in/login_screen.dart';
import 'package:cheque_scan/pages/chequebackscan/back_cheque_scan.dart';
import 'package:cheque_scan/pages/chequefrontscan/front_cheque_scan.dart';
import 'package:cheque_scan/pages/homescreen/home_screen.dart';
import 'package:cheque_scan/pages/introduction_view.dart';
import 'package:cheque_scan/pages/newaccount/link_new_account.dart';
//import 'package:cheque_scan/pages/transactions/transactions_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/provider/Transactionsdata.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TransactionsData>(
        create: (BuildContext context) => TransactionsData()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: LoginScreen()),
    );
  }
}

