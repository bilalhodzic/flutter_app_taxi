import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/services/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  Userinfo? _user;
  Userinfo? get user => _user;

  Future<void> setUser(Userinfo? usr) async {
    _user = usr;
  }

  Future<void> login(data) async {
    try {
      print(data);
      inspect(data);
      var res = await AuthServices.loginService(data);
      log(res);
      print(res);

      // _user = Userinfo.fromJson(res['data']['userinfo']);

      // final res2 = await ProfileServices.getProfileData();
      // final data = res2['data'];
      // _user!.nationality = data['nationality'] ?? "null";
      // _user!.address = data['address'] ?? "";
      // _user!.docType = data['doc_type'];
      // _user!.emailVerified = 1;

      // if (data['doc_type'] == '1') {
      //   await StorageServices.saveDocToLocal(docType: '1', data: data);
      // } else if (data['doc_type'] == '0')
      //   await StorageServices.saveDocToLocal(docType: '0', data: data);

      // await PreferencesUtils.setUser(_user!);

      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
