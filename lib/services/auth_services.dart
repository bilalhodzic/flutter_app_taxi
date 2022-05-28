import 'package:flutter_app/api/api_model.dart';
import 'package:flutter_app/models/user_model.dart';

class AuthServices {
  static Future loginService(data) async {
    final res = ApiModels().postRequest('authentication/login', data);

    return res;
  }
}
