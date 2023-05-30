import 'package:cheque_scan/pages/authentication/sign_in/sign_in_view_model.dart';
import 'package:cheque_scan/pages/introduction_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/rounded_button.dart';
import '../../../constants/constants.dart';
import '../../../core/custom_textfield.dart';
import '../../../core/enums/textfield_type.dart';
import '../../homescreen/home_screen.dart';
import '../sign_up/signup_screen.dart';

bool obscure = true;
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SignInViewModel signInViewModel = SignInViewModel();

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
                                      signInViewModel.usernameController,
                                  type: TextFieldType.name,
                                //  prefixImage: 'assets/icons/lock.svg',
                                  hintText: 'Email',
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomTextField(
                                  controller:
                                      signInViewModel.passwordController,
                                //  prefixImage: 'assets/icons/password.svg',
                                  hintText: 'Password',
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
                                title: 'Login',
                                color: kPrimaryColor,
                                backgroundColor: Colors.white,
                                press: () => {

                                Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) =>  HomeScreen()))
                                },
                              ),
                            ),
                            SizedBox(height: 25,),
                            Center(
                              child: GestureDetector(
                                  onTap: (){
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) =>  SignUpScreen()));
                                  },
                                  child: const Text(
                                    'Don\'t have an account? Sign-Up?',
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
