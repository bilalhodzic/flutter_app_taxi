import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  static Userinfo? _user;
  Userinfo? get user => _user;

  static void setUser(Userinfo? usr) {
    _user = usr;
    // inspect(_user);
  }
}
