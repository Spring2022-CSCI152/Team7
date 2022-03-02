import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  final AuthMethods _authMethods = AuthMethods();
  User?
      _user; // underscore makes the variable private, prevent method call bugs

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
