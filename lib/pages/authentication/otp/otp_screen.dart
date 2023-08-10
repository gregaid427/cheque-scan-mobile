import 'package:cheque_scan/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/shared_preference.dart';
import '../../../constants/pagetransitions.dart';
import '../../homescreen/home_screen.dart';


class OtpScreen extends StatefulWidget {
  // final String phoneNumber;

  // const OtpScreen(this.phoneNumber);

  @override
  State<StatefulWidget> createState() {
    return _OtpScreenState();
  }
}

class _OtpScreenState extends State<OtpScreen> {
  // SmsQuery _smsQuery = new SmsQuery();
  var onTapRecognizer;

  bool hasError = false;
  bool hasError1 = false;

  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    // onTapRecognizer = TapGestureRecognizer()
    //   ..onTap = () {
    //     // Navigator.pop(context);
    //     print('resend');
    //   };

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  UserPreferences userPreferences = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/logo.PNG',
                height: 50,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Text(
                  '  OTP verification',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 8,
                ),
                child: RichText(
                  text: const TextSpan(
                    text: 'Enter the code sent to your number or email',
                    children: [
                      // TextSpan(
                      //   text: 'widget.phoneNumber',
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 15,
                      //   ),
                      // ),
                    ],
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 80),
                child: PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  // shape: PinCodeFieldShape.box,
                  animationDuration: const Duration(milliseconds: 300),
                  // borderRadius: BorderRadius.circular(5),
                  // backgroundColor:
                  // Theme.of(context).brightness == Brightness.light
                  //     ? Colors.white
                  //     : Colors.grey[900],
                  // fieldHeight: 50,
                  // fieldWidth: 40,
                  onChanged: (value) {
                    setState(() {
                      currentText = value;
                    });
                  },
                  appContext: context,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                // error showing widget
                child: Text(
                  hasError ? "Fill up all the cells properly" : "",textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red.shade300,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                // error showing widget
                child: Text(
                  hasError1 ? "Incorrect Pin" : "", textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red.shade300,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  //call reset
                },
                child: const Text(
                  "Resend OTP",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 30),
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: []),
                  child: ButtonTheme(
                    height: 50,
                    child: TextButton(
                      onPressed: () async {
                         await validateOtp();
                      },
                      child: const Center(
                        child: Text(
                          "Verify",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validateOtp()  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? pin = prefs.getString("otp");
    print(pin);
    if (currentText.length != 4) {

      setState(() {
            hasError = true;
          });
        } else {
      if( currentText != pin ) {
        setState(() {
          hasError1 = true;
          hasError = false;

        });
      }
      if( currentText == pin ){
        setState(() {
          hasError = false;
          hasError1 = false;

        });
        print('correct pin');
       // userPreferences.setUserStatus(2);
            Navigator.pushReplacement(
            context,
            SizeTransition5(HomeScreen()));
      }

    }


  }

  // Future<void> _validateOtp(OtpModel model) async {
  //   print(currentText);
  //   // conditions for validating
  //   if (currentText.length != 4) {
  //     setState(() {
  //       hasError = true;
  //     });
  //   } else {
  //     setState(() {
  //       hasError = false;
  //       model.otp = currentText;
  //     });
  //     var result = await model.validateOtpFromServer();
  //     if (result) {
  //       //lets check to see if the user exist or not..
  //       User? user = await User()
  //           .select()
  //           .phoneNumber
  //           .equals(model.phoneNumber)
  //           .toSingle();
  //       if (user == null) {
  //         //we need to obtain the user details from the server, so we can populate them here....
  //         var userData = await model.getUserDetails();
  //         user = User();
  //         user.name = userData['name'];
  //         user.createdAt = DateTime.parse(userData['createdAt']);
  //         user.lastLoginDate = DateTime.now();
  //         user.password = 'boom';
  //         user.phoneNumber = model.userUUID;
  //         user.loginCount = 0;
  //
  //         await user.save();
  //
  //         model.setUser(user);
  //       }
  //
  //       Navigator.of(context).pushReplacementNamed(SurveyListRoute);
  //     }
  //   }
  // }
}
