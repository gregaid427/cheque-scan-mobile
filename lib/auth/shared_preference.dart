import 'dart:async';

import 'package:cheque_scan/auth/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUserid(String Userid, String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("user_id", Userid!);
    prefs.setString("token", token!);

    print(Userid);
    print(token);

    return prefs.commit();
  }

  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    print(user.email);

    prefs.setString("user_id", user.user_id!);
    prefs.setString("firstName", user.firstName!);
    prefs.setString("lastName", user.lastName!);
    prefs.setString("otherName", user.otherName!);

    prefs.setString("verified", user.verified!);

    prefs.setString("email", user.email!);
    prefs.setString("contact", user.contact!);
    prefs.setString("dob", user.dob!);
    prefs.setString("token", user.access_token!);

    print("user data saved locally");
    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? user_id = prefs.getString("user_id");
    String? firstName = prefs.getString("firstName");
    String? otherName = prefs.getString("otherName");

    String? lastName = prefs.getString("lastName");
    String? email = prefs.getString("email");
    String? contact = prefs.getString("contact");
    String? role = prefs.getString("role");
    String? access_token = prefs.getString("access_token");
    String? dob = prefs.getString("dob");
    String? verified = prefs.getString("verified");

    return User(
      user_id: user_id!,
      firstName: firstName!,
      lastName: lastName!,
      otherName: otherName!,
      dob: dob!,
      email: email!,
      contact: contact!,
      role: role!,
      access_token: access_token!,
      verified: verified!,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("user_id");
    prefs.remove("firstname");
    prefs.remove("lastname");
    prefs.remove("email");
    prefs.remove("contact");
    prefs.remove("role");
    prefs.remove("access_token");
    prefs.remove("verified");
    prefs.remove("dob");
  }

  Future<String?> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }
}
