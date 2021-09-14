import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  var ip = kReleaseMode
      ? "https://my-blog-app-api.herokuapp.com"
      : "http://192.168.0.105:5000";

  Future getPosts() async {
    print(ip);
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
    http.Response response = await http.get(uri);
    if (response.statusCode.toString().startsWith("2")) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
