import 'package:cheque_scan/auth/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user.dart';


class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {

    User user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text("DASHBOARD PAGE"),
        elevation: 0.1,
      ),
      body: Column(
        children: [
          SizedBox(height: 100,),
          Center(child: Text(user.email!)),
          SizedBox(height: 100),
          ElevatedButton(onPressed: (){}, child: Text("Logout"), )
        ],
      ),
    );
  }
}
