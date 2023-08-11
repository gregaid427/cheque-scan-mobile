import 'package:cheque_scan/pages/authentication/sign_in/sign_in_view_model.dart';
import 'package:cheque_scan/pages/authentication/sign_up/sign_up_view_model.dart';
import 'package:cheque_scan/pages/introduction_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../../auth/api_client.dart';
import '../../../auth/shared_preference.dart';
import '../../../auth/validator.dart';
import '../../../components/rounded_button.dart';
import '../../../constants/constants.dart';
import '../../../core/custom_textfield.dart';
import '../../../core/enums/textfield_type.dart';
import '../otp/otp_screen.dart';
import '../sign_in/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool obscure = true;

class _SignUpScreenState extends State<SignUpScreen> {
  SignupViewModel signupViewModel = SignupViewModel();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController otherNameController = TextEditingController();
  final TextEditingController ghanaCardController = TextEditingController();

  final TextEditingController confirmpasswordController =
      TextEditingController();

  final ApiClient _apiClient = ApiClient();
  bool _showPassword = false;

  Future<void> registerUsers() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Creating Account...'),
        backgroundColor: Colors.green.shade300,
      ));


      Map<String, dynamic> userData = {
        "email": emailController.text,
        "password": passwordController.text,
        "contact": contactController.text,
        "role": "100",
        "firstname": firstNameController.text,
        "lastname": lastNameController.text,
        "othername": otherNameController.text,
        "ghCardNumber": ghanaCardController.text,
        "sex": "undefined",
        "createdAt": DateTime.now().toString(),
        "dob": "undefined"
      };

      dynamic res = await _apiClient.registerUser(userData);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      UserPreferences userPreferences = UserPreferences();
      userPreferences.setUserStatus(1);

     // print(res['userPin']);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('otpCode', res['userPin'].toString());

      if (res == 'Connection Error') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //  content: Text('Error: Unable to create account - ${res['message']}'),
          content: Text('Error: Unable to create account '),

          backgroundColor: Colors.red.shade300,
        ));
      }
      if (res['success'] == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OtpScreen()));
      }

    }
  }

  final formKey = GlobalKey<FormState>();

  void changePasswordvisibility() {
    setState(() {
      obscure = !obscure;
    });
    // notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
        builder: (context, model, child) => SafeArea(
      child: Scaffold(
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
                                    validator: (value) =>
                                        Validator.validateName(value ?? ""),
                                    controller: firstNameController,
                                    type: TextFieldType.name,
                                    //  prefixImage: 'assets/icons/lock.svg',
                                    hintText: 'First Name',
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextField(
                                    validator: (value) =>
                                        Validator.validateName(value ?? ""),
                                    controller: lastNameController,
                                    type: TextFieldType.name,
                                    //  prefixImage: 'assets/icons/lock.svg',
                                    hintText: 'Last Name',
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextField(
                                    // validator: (value) =>
                                    //     Validator.validateName(value ?? ""),
                                    controller: otherNameController,
                                    type: TextFieldType.name,
                                    //  prefixImage: 'assets/icons/lock.svg',
                                    hintText: 'Other Names',
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextField(
                                    validator: (value) =>
                                        Validator.validateEmail(value ?? ""),
                                    controller: emailController,
                                    type: TextFieldType.email,
                                    //  prefixImage: 'assets/icons/lock.svg',
                                    hintText: 'Email',
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextField(
                                    validator: (value) =>
                                        Validator.validatePassword(value ?? ""),
                                    controller: contactController,
                                    type: TextFieldType.phone,
                                    inputType: TextInputType.number,
                                    //  prefixImage: 'assets/icons/lock.svg',
                                    hintText: 'Phone Number',
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextField(
                                    validator: (value) =>
                                        Validator.validateName(value ?? ""),
                                    controller: ghanaCardController,
                                    type: TextFieldType.others,
                                    //  prefixImage: 'assets/icons/lock.svg',
                                    hintText: 'Ghana Card Number',
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextField(
                                    validator: (value) =>
                                        Validator.validatePassword(value ?? ""),
                                    controller: passwordController,
                                    //  prefixImage: 'assets/icons/password.svg',
                                    hintText: 'Password',
                                    obscure: obscure,
                                    type: TextFieldType.password,
                                    suffixFunc: () =>
                                        changePasswordvisibility(),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextField(
                                    validator: (value) =>
                                        Validator.validateConfirmPassword(value, passwordController.text ),
                                    controller: confirmpasswordController,
                                    //  prefixImage: 'assets/icons/password.svg',
                                    hintText: 'Confirm Password',
                                    obscure: obscure,
                                    type: TextFieldType.password,
                                    suffixFunc: () => changePasswordvisibility(),
                                  ),
                                  const SizedBox(
                                    height: 15,
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
                                  press: () => registerUsers(),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Center(
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    },
                                    child: const Text(
                                      'Already Registered? Log In',
                                      style: kTitleStyle,
                                    )),
                              ),SizedBox(height: 20,)
                            ]),
                      ),
                    ))),
              ),
            ]),
          )),
    ), viewModelBuilder: () => SignupViewModel() );
  }
}
