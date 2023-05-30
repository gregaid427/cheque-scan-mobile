import 'package:cheque_scan/components/%20custom_appbar.dart';
import 'package:cheque_scan/components/rounded_button.dart';
import 'package:cheque_scan/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/custom_textfield1.dart';
import '../../core/enums/textfield_type.dart';

class LinkNewAccount extends StatelessWidget {
  LinkNewAccount({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppbar(),
            const Text('Transaction Preview', style: kTitleStyle),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Container(
                      child: Column(
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(height: 50.0),
                              Text(
                                '      Account Type',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 2.0),
                              CustomTextField1(
                                hintText: '',
                                obscure: false,
                                type: TextFieldType.name,
                                inputType: TextInputType.text,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '      Bank',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 2.0),
                              CustomTextField1(
                                hintText: '',
                                obscure: false,
                                type: TextFieldType.name,
                                inputType: TextInputType.text,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '      Account Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 2.0),
                              CustomTextField1(
                                hintText: '',
                                obscure: false,
                                type: TextFieldType.accountNo,
                                inputType: TextInputType.text,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '      Account Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 2.0),
                              CustomTextField1(
                                hintText: '',
                                obscure: false,
                                type: TextFieldType.accountNo,
                                inputType: TextInputType.text,
                              ),
                            ],
                          ))
                    ],
                  )),
                  SizedBox(height: 100),
                  RoundedButton(
                    title: 'Continue',
                    color: Colors.white,
                    backgroundColor: kPrimaryColor,
                    press: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
