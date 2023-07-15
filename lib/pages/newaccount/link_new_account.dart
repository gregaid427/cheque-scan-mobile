import 'package:cheque_scan/components/%20custom_appbar.dart';
import 'package:cheque_scan/components/rounded_button.dart';
import 'package:cheque_scan/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/custom_textfield1.dart';
import '../../core/enums/textfield_type.dart';
import 'linknewaccountmodel.dart';


class LinkNewAccount extends StatelessWidget {
  LinkNewAccount({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  CreateAccountModel _createAccountModel = new CreateAccountModel();

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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Container(
                        child: Column(
                      children: [
                        Form(
                            key: _formKey,
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 50.0),
                                const Text(
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
                                  onChanged: (value){_createAccountModel.accountType = value; },
                                ),
                                SizedBox(height: 10.0),
                                const Text(
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
                                  onChanged: (value){_createAccountModel.bank = value; },

                                ),
                                SizedBox(height: 10.0),
                                const Text(
                                  '      Account Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                SizedBox(height: 2.0),
                                CustomTextField1(
                                  hintText: '',
                                  obscure: false,
                                  type: TextFieldType.name,
                                  inputType: TextInputType.text,
                                  onChanged: (value){_createAccountModel.accountNumber = value; },

                                ),
                            //    SizedBox(height: 10.0),
                                // const Text(
                                //   '      Account Number',
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold, fontSize: 18),
                                // ),
                                // SizedBox(height: 2.0),
                                // CustomTextField1(
                                //   hintText: '',
                                //   type: TextFieldType.name,
                                //   inputType: TextInputType.text,
                                //   onChanged: (value){_createAccountModel.accountName = value; },
                                //
                                // ),
                               const SizedBox(height: 50),

                                RoundedButton(
                                  title: 'Continue',
                                  color: Colors.white,
                                  backgroundColor: kPrimaryColor,
                                  press: () async{
                                    await _createAccountModel.LinkAccountService();
                                  },
                                ),],
                            )
                        )
                      ],
                    )),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
