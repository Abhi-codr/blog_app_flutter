import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper({required this.url});
  final ip = "http://192.168.0.105:5000";
  // final q = '';
  // final uri = ;
  Future getData() async {
    final Uri uri = Uri.parse("$ip$url");
    print(uri);
    http.Response response = await http.get(uri);
    if (response.statusCode.toString().startsWith("2")) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
