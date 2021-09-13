import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final ip = "http://192.168.0.105:5000";

  Future getPosts() async {
    final Uri uri = Uri.parse("$ip/posts");
    http.Response response = await http.get(uri);
    if (response.statusCode.toString().startsWith("2")) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future getPost(id) async {
    final Uri uri = Uri.parse("$ip/posts/$id");
    print(uri.toString());
    http.Response response = await http.get(uri);
    if (response.statusCode.toString().startsWith("2")) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
