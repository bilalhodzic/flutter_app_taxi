import 'package:flutter_app/api/api_model.dart';
import 'package:flutter_app/models/user_model.dart';

class AuthServices {
  static Future loginService(data) async {
    final res =
        await ApiModels().postRequest(url: 'authentication/login', data: data);

    return res;
  }
}
