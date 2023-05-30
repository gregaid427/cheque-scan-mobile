import 'package:flutter/cupertino.dart';

class SignInViewModel  {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscure = true;

  void changePasswordvisibility() {
    obscure = !obscure;
   // notifyListeners();
  }

}