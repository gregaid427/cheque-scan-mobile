import 'package:cheque_scan/components/%20custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/rounded_button.dart';
import '../../constants/constants.dart';

class TransactionsPreview extends StatelessWidget {
  const TransactionsPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            CustomAppbar(),
            const Text('Transaction Preview', style: kTitleStyle),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text('Cheque Issuer', style: TextStyle( color: Colors.deepOrange.shade400,fontSize: 20)),
                            const SizedBox(height:13),


                            Text('Name :', style: TextStyle( color: Colors.grey,fontSize: 17)),
                            const SizedBox(height: 10, ),
                            Text('Bank :', style: TextStyle( color: Colors.grey,fontSize: 17)),
                            const SizedBox(height: 10, ),
                            Text('Account Number :', style: TextStyle( color: Colors.grey,fontSize: 17)),

                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text('Cheque Depositor', style: TextStyle( color: Colors.deepOrange.shade400,fontSize: 20)),
                            const SizedBox(height:13),


                            Text('Name :', style: TextStyle( color: Colors.grey,fontSize: 17)),
                            const SizedBox(height: 10, ),
                            Text('Account Type :', style: TextStyle( color: Colors.grey,fontSize: 17)),
                            const SizedBox(height: 10, ),
                            Text('Bank :', style: TextStyle( color: Colors.grey,fontSize: 17)),
                            const SizedBox(height: 10, ),
                            Text('Account Number :', style: TextStyle( color: Colors.grey,fontSize: 17)),

                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text('Amount', style: TextStyle( color: Colors.grey,fontSize: 17)),
                            const SizedBox(height:13),
                            Text('GHS 13,000,000.00', style: TextStyle( color: Colors.deepOrange.shade400,fontSize: 20)),



                          ],
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                      child: Row(
                    children: const [
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

class ConfimButton extends StatelessWidget {
  const ConfimButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          // color: kPrimaryGradientColor,
          height: 50,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(30)),
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
        onTap: () {},
        child: Container(
          height: 50,
          // color: kPrimaryGradientColor,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.deepOrange,width: 2)
          ),

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
