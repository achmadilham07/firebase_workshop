import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late User _user;

  set user(User value) {
    _user = value;
    notifyListeners();
  }

  User get user => _user;
}
