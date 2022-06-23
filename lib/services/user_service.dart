import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/api/api_model.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/providers/user_provider.dart';
import 'package:http/http.dart';

class UserService {
  static Future getUser(int id) async {
    Response res = await ApiModels().getRequest(url: 'user/$id');
    if (res.statusCode == 200) {
      var decoded = jsonDecode(res.body);
      UserProvider.setUser(Userinfo.fromJson(decoded));
      inspect(Userinfo.fromJson(decoded));
    }

    return res;
  }
}
