import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/api/api_model.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/services/user_service.dart';
import 'package:http/http.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthServices {
  static Future loginService(data) async {
    Response res =
        await ApiModels().postRequest(url: 'authentication/login', data: data);
    if (res.statusCode == 200) {
      var token = jsonDecode(res.body)['Token'];
      AuthProvider.instance.setToken(token);

      var parsedToken = Jwt.parseJwt(token ?? '');
      await UserService.getUser(int.parse(parsedToken['UserId']));
    } else {
      AuthProvider.instance.setError(jsonDecode(res.body)['ERROR'][0], 'login');
    }

    return res;
  }

  static Future registerService(data) async {
    Response res = await ApiModels()
        .postRequest(url: 'authentication/register', data: data);
    inspect(res);
    if (res.statusCode == 200) {
      var token = jsonDecode(res.body)['Token'];
      AuthProvider.instance.setToken(token);

      var parsedToken = Jwt.parseJwt(token ?? '');
      await UserService.getUser(int.parse(parsedToken['UserId']));
    } else {
      AuthProvider.instance
          .setError(jsonDecode(res.body)['ERROR'][0], 'register');
    }

    return res;
  }

  static Future forgotPassword(data) async {
    Response res = await ApiModels()
        .postRequest(url: 'authentication/forgotpassword', data: data);
    inspect(res);
    if (res.statusCode == 200) {}
  }
}
