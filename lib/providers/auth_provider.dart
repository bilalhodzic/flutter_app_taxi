import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/services/auth_services.dart';
import 'package:flutter_app/services/user_service.dart';
import 'package:http/http.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthProvider extends ChangeNotifier {
  //singleton
  static AuthProvider? _instance;
  static AuthProvider get instance {
    if (_instance == null) {
      _instance = AuthProvider._();
    }

    return _instance!;
  }

  AuthProvider._() {}
  AuthProvider._internal();

  String? token;
  String? loginError;
  String? registerError;

  setError(err, String type) {
    if (type == 'login') {
      loginError = err;
    } else if (type == 'register') {
      registerError = err;
    }
    notifyListeners();
  }

  setToken(token) {
    token = token;
    notifyListeners();
  }
}
