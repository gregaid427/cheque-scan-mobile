import 'package:cheque_scan/pages/authentication/sign_in/sign_in_view_model.dart';
import 'package:cheque_scan/pages/authentication/sign_up/sign_up_view_model.dart';
import 'package:cheque_scan/pages/introduction_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/rounded_button.dart';
import '../../../constants/constants.dart';
import '../../../core/custom_textfield.dart';
import '../../../core/enums/textfield_type.dart';
import '../sign_in/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool obscure = true;

class _SignUpScreenState extends State<SignUpScreen> {
  SignupViewModel signupViewModel = SignupViewModel();

  final formKey = GlobalKey<FormState>();

  void changePasswordvisibility() {
    setState(() {
      obscure = !obscure;
    });
    // notifyListeners();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(children: [
            Expanded(
              flex: 2,
              child: Container(
                child: const Center(
                  child: Image(
                    image: AssetImage(
                      'assets/images/logo.PNG',
                    ),
                    width: 200.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                  decoration: const BoxDecoration(
                      gradient: kButtonGradientColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50))),
                  child: Center(
                      child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                  controller:
                                      signupViewModel.usernameController,
                                  type: TextFieldType.name,
                                //  prefixImage: 'assets/icons/lock.svg',
                                  hintText: 'Email',
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomTextField(
                                  controller:
                                      signupViewModel.passwordController,
                                //  prefixImage: 'assets/icons/password.svg',
                                  hintText: 'Password',
                                  obscure: obscure,
                                  type: TextFieldType.password,
                                  suffixFunc: () => signupViewModel
                                      .changePasswordvisibility(),
                                ),
                                CustomTextField(
                                  controller:
                                  signupViewModel.confirmpasswordController,
                                  //  prefixImage: 'assets/icons/password.svg',
                                  hintText: 'Confirm Password',
                                  obscure: obscure,
                                  type: TextFieldType.password,
                                  suffixFunc: () => changePasswordvisibility(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    'Forgot Password?',
                                    style: kTitleStyle,
                                  )),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: RoundedButton(
                                title: 'Submit',
                                color: kPrimaryColor,
                                backgroundColor: Colors.white,
                                press: () => {},
                              ),
                            ),
                            SizedBox(height: 25,),
                            Center(
                              child: GestureDetector(
                                  onTap: (){
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) =>  LoginScreen()));
                                  },
                                  child: const Text(
                                    'Already Registered? Log In?',
                                    style: kTitleStyle,
                                  )),
                            ),
                          ]),
                    ),
                  ))),
            ),
          ]),
        ));
  }
}


