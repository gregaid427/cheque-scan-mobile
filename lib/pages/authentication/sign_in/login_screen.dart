import 'package:cheque_scan/pages/authentication/sign_in/sign_in_view_model.dart';
import 'package:cheque_scan/pages/introduction_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../auth/api_client.dart';
import '../../../auth/shared_preference.dart';
import '../../../auth/user.dart';
import '../../../auth/validator.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  final UserPreferences _userPreferences = UserPreferences();
  bool _showPassword = false;

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Authenticating...'),
        backgroundColor: Colors.green.shade300,
      ));

      dynamic res = await _apiClient.login(
        emailController.text,
        passwordController.text,
      );

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['success'] == 1) {
        String accessToken = res['access_token'];
        String? User_id = res['user_data']['user_id'].toString();
        print('correct credentials');
        //persist user data by sharedpreferences
        _userPreferences.saveUserid(User_id!, accessToken);
        dynamic profileresponse =
            await _apiClient.getUserProfileData(accessToken, User_id);
        //persist user data by sharedpreferences
        if (profileresponse['success'] == 1) {
          var userData = profileresponse['data'];
          User authUser = User.fromJson(userData);
          UserPreferences().saveUser(authUser);
        }

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${res['data']}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }

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
                  child: SingleChildScrollView(
                    child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              // controller:signInViewModel.usernameController,
                              controller: emailController,
                              validator: (value) {
                                return Validator.validateEmail(value ?? "");
                              },
                              type: TextFieldType.email,
                              //  prefixImage: 'assets/icons/lock.svg',
                              hintText: 'Email',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextField(
                              //  controller:signInViewModel.passwordController,
                              //  obscure: _showPassword,
                              controller: passwordController,
                              validator: (value) {
                                return Validator.validatePassword(
                                    value ?? "");
                              },

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
                            press: () => login(),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen()));
                              },
                              child: const Text(
                                'Don\'t have an account? Sign-Up',
                                style: kTitleStyle,
                              )),
                        ),
                      ]),
                    ),
                  )),
            ),
          ]),
        ));
  }
}
