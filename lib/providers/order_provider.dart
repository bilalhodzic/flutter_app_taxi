import 'package:flutter/widgets.dart';

class OrderProvider extends ChangeNotifier {
  //singleton
  static OrderProvider? _instance;
  static OrderProvider get instance {
    if (_instance == null) {
      _instance = OrderProvider._();
    }

    return _instance!;
  }

  OrderProvider._();
  OrderProvider._internal();
}
