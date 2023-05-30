import 'dart:developer';

import 'package:cheque_scan/components/rounded_button.dart';
import 'package:cheque_scan/pages/authentication/sign_in/login_screen.dart';
import 'package:cheque_scan/pages/newaccount/link_new_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/ custom_appbar.dart';
import '../../constants/constants.dart';
import '../scan/Screen/recognization_page.dart';
import '../scan/Utils/image_cropper_page.dart';
import '../scan/Utils/image_picker_class.dart';

import 'cardScrollview_model.dart';
import 'cardscrollview.dart';
import 'homescreenviewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    CardScrollViewModel cardScrollViewModel = CardScrollViewModel();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppbar(),
            Container(

              height: screenHeight * 0.30,

              child: Column(
                children: [
                  Image( image: AssetImage('assets/images/scanimg.PNG'), height: screenHeight * 0.24, ),
                  Spacer(),
                  GestureDetector(   onTap: () {
                    imagePickerModal(context, onCameraTap: () {
                      log("Camera");
                      pickImage(source: ImageSource.camera).then((value) {
                        if (value != '') {
                          imageCropperView(value, context).then((value) {
                            if (value != '') {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => RecognizePage(
                                    path: value,
                                  ),
                                ),
                              );
                            }
                          });
                        }
                      });
                    }, onGalleryTap: () {
                      log("Gallery");
                      pickImage(source: ImageSource.gallery).then((value) {
                        if (value != '') {
                          imageCropperView(value, context).then((value) {
                            if (value != '') {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => RecognizePage(
                                    path: value,
                                  ),
                                ),
                              );
                            }
                          });
                        }else{
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => LoginScreen(),
                            ),
                          );
                        }
                      });
                    });
                  }, child: const Text('scan cheque' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                  SizedBox(height: 10,)
                ],
              ),
            ),
            CardScrollView(cardItems: cardScrollViewModel.cardItems),
            const LinkAccountText(),
            History(),
            Flexible(child: SingleListItem())
          ],
        ),
      ),
    );
  }
}

class SingleListItem extends StatelessWidget {
  const SingleListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
              HomeScreeViewModel.historyItems.length,
              (index) => HistorySingleItem(
                    issuer: HomeScreeViewModel.Trimstring(
                        HomeScreeViewModel.historyItems[index]["issuer"]),
                    accountDeposited: HomeScreeViewModel.Trimstring(
                        HomeScreeViewModel.historyItems[index]["account"]),
                    amount: HomeScreeViewModel.Trimstring(
                        HomeScreeViewModel.historyItems[index]["amount"]),
                  )),
        ),
      ),
    );
  }
}

class HistorySingleItem extends StatelessWidget {
  const HistorySingleItem({
    Key? key,
    this.issuer,
    this.accountDeposited,
    this.amount,
  }) : super(key: key);
  final issuer;
  final accountDeposited;
  final amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 6, child: Text(issuer, style: kHistoryStyle1)),
        Expanded(flex: 6, child: Text(accountDeposited, style: kHistoryStyle1)),
        Expanded(flex: 4, child: Align( alignment:Alignment.topRight ,child: Text(amount, style: kHistoryStyle1))),
      ],
    );
  }
}

class History extends StatelessWidget {
  const History({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Colors.grey.shade200,
          width: double.infinity,
          child: const Text(
            "Recent History",
            style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Issuer', style: kHistoryStyle),
              Text('      Account Deposit', style: kHistoryStyle),
              Text('Amount', style: kHistoryStyle),
            ],
          ),
        )
      ],
    );
  }
}

class LinkAccountText extends StatelessWidget {
  const LinkAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LinkNewAccount()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              CupertinoIcons.add_circled,
              color: kPrimaryColor,
              size: 32,
            ),
            Text(
              'Link New Account',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}




void imagePickerModal(BuildContext context,
    {VoidCallback? onCameraTap, VoidCallback? onGalleryTap}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 220,
          child: Column(
            children: [
              GestureDetector(
                onTap: onCameraTap,
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: const Text("Camera",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: onGalleryTap,
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: const Text("Gallery",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

