import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/auth_widget.dart';
import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        title: 'eTaxi',
        theme:
            ThemeData(primarySwatch: colorSwatch, primaryColor: primaryColor),
        home: AuthWidget(),
      ),
    );
  }
}
