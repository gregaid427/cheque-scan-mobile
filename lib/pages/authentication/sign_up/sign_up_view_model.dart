import 'package:flutter/cupertino.dart';

class SignupViewModel  extends ChangeNotifier{

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool obscure = true;

  void changePasswordvisibility() {
    obscure = !obscure;
   // notifyListeners();
  }

}