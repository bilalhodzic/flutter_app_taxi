import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/api/api_model.dart';
import 'package:flutter_app/models/vehicle_model.dart';
import 'package:flutter_app/models/vehicle_type_model.dart';
import 'package:flutter_app/providers/home_provider.dart';
import 'package:http/http.dart';

class HomeService {
  static Future getVehicleTypes() async {
    try {
      Response res = await ApiModels().getRequest(url: 'vehicleType');
      inspect(res);

      if (res.statusCode == 200) {
        List<VehicleType> types = [];
        var data = json.decode(res.body);
        data.forEach((element) {
          types.add(VehicleType.fromJson(element));
        });
        HomeProvider.instance.setVehicleTypes(types);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<VehicleModel>> getSelfDrivingVehicles() async {
    List<VehicleModel> vehicles = [];
    try {
      Response res = await ApiModels().getRequest(url: 'vehicle');
      print(res.statusCode);

      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        inspect(data);
        data.forEach((element) {
          vehicles.add(VehicleModel.fromJson(element));
        });
        HomeProvider.instance.setAvailableModels(vehicles);
      }
    } catch (e) {
      print('Error in getSelfDrivingVehicles: $e');
    }
    return vehicles;
  }
}
