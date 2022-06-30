import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/models/brand_model.dart';
import 'package:flutter_app/models/city_model.dart';
import 'package:flutter_app/models/hub_model.dart';
import 'package:flutter_app/models/vehicle_model.dart';
import 'package:flutter_app/models/vehicle_type_model.dart';

class HomeProvider extends ChangeNotifier {
  //singleton
  static HomeProvider? _instance;
  static HomeProvider get instance {
    if (_instance == null) {
      _instance = HomeProvider._();
    }

    return _instance!;
  }

  HomeProvider._();
  HomeProvider._internal();

  String? _city;
  String? get city => _city;

  List<City> _cities = [];
  List<City> get cities => [..._cities];

  List<VehicleType> _vehicleType = [];
  List<VehicleType> get vehicleType => [..._vehicleType];

  List<VehicleModel> _availableModel = [];
  List<VehicleModel> get availableModel => [..._availableModel];

  final List<Map<String, List<BrandModel>>> _brandModel = [];
  List<Map<String, List<BrandModel>>> get brandModel => [..._brandModel];

  List<Hub> _allHub = [];
  List<Hub> get allHub => [..._allHub];

  void setAvailableModels(List<VehicleModel> vehicles) {
    _availableModel = vehicles;
  }

  void setVehicleTypes(List<VehicleType> types) {
    _vehicleType = types;
  }

  void setAllHubs(List<Hub> hubs) {
    _allHub = hubs;
  }

  // Future<bool> checkForCity() async {
  //   final res = await PreferencesUtils.getPref(PreferencesUtils.currentCity);

  //   if (res != null) {
  //     _city = await PreferencesUtils.getPref(PreferencesUtils.currentCity);
  //     return true;
  //   } else
  //     return false;
  // }

  // Future<void> getCities() async {
  //   try {
  //     final res = await BasicServices.getCities();

  //     List<City> _items = [];
  //     if (res['success'] == '1') {
  //       res['data'].forEach((element) {
  //         _items.add(City.fromJson(element));
  //       });
  //     }
  //     _cities = _items;

  //     final res2 = await BasicServices.getHub();

  //     List<Hub> _items2 = [];

  //     res2['data'].forEach((ele) {
  //       _items2.add(Hub.fromJson(ele));
  //     });

  //     _allHub = _items2;
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  // Future<void> saveCity(String city) async {
  //   await PreferencesUtils.setPref(PreferencesUtils.currentCity, city);
  // }

  // Future<void> getVehicleClasses() async {
  //   try {
  //     final res = await BasicServices.getVehicleClasses();

  //     List<VehicleType> _items = [];

  //     if (res['success'] == '1') {
  //       res['data'].forEach((element) {
  //         _items.add(VehicleType.fromJson(element));
  //       });
  //     }
  //     _vehicleType = _items;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<void> getModelByDateCity() async {
  //   try {
  //     if (_cities.length == 0) await getCities();

  //     final res = await BasicServices.getModelByDateCity();

  //     List<VehicleModel> _items = [];

  //     if (res['success'] == '1') {
  //       res['data'].forEach((element) {
  //         _items.add(VehicleModel.fromJson(element));
  //       });
  //     }
  //     _availableModel = _items;

  //     notifyListeners();
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
