import 'package:flutter/cupertino.dart';

class SignInViewModel extends ChangeNotifier {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscure = true;

  void changePasswordvisibility(BuildContext context) {
    obscure = !obscure;
   // notifyListeners();
  }

}