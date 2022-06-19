import 'dart:convert';

import 'package:http/http.dart' as http;

const realDeviceUri = 'https://192.168.0.15:49155/';
const localUri = 'http://10.0.2.2:44310/';
const ngRokUri = 'https://1a5f-93-180-105-223.eu.ngrok.io/';

class ApiModels {
  // final apiUrl = 'https://localhost:44310/';

  String apiUrl = realDeviceUri;

  Future postRequest({required String url, Object data = const {}}) async {
    final dataJson = jsonEncode(data);

    final response = await http.post(Uri.parse('$apiUrl$url'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: dataJson);
    return response;
  }

  Future getRequest({required String url}) async {
    final response = await http.get(
      Uri.parse('$apiUrl$url'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}
