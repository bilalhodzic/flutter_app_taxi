import 'dart:developer';

import 'package:flutter_app/api/api_model.dart';
import 'package:flutter_app/models/vehicle_type_model.dart';
import 'package:http/http.dart';

class HomeService {
  static Future getVehicleTypes() async {
    try {
      Response res = await ApiModels().getRequest(url: 'vehicleType');
      inspect(res);

      if (res.statusCode == 200) {
        List<VehicleType> _items = [];
      }
    } catch (e) {
      print(e);
    }
  }
}
