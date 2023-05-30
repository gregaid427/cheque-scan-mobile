import 'package:cheque_scan/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.menu,
            color: kPrimaryColor,
            size: 35,
          ),
          Image(
            image: AssetImage(
              'assets/images/logo.PNG',
            ),
            width: 120,
          )
        ],
      ),
    );
  }
}
