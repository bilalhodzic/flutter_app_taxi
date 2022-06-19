import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/services/auth_services.dart';
import 'package:flutter_app/services/user_service.dart';
import 'package:http/http.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthProvider extends ChangeNotifier {
  String? token;
  String? error;

  setError(err) {
    error = err;
    notifyListeners();
  }

//**
//Ovo je funckija */
  Future<void> login(data) async {
    try {
      Response res = await AuthServices.loginService(data);
      if (res.statusCode == 200) {
        token = jsonDecode(res.body)['Token'];

        var parsedToken = Jwt.parseJwt(token ?? '');
        await UserService.getUser(int.parse(parsedToken['UserId']));
      } else {
        setError(jsonDecode(res.body)['ERROR'][0]);
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
