// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'package:http_parser/http_parser.dart';

class Invoker {
  
  static Future<dynamic> get (String path, bool shouldBeAuth, {Map<String, String>? query}) async {
    if(!shouldBeAuth){
      final response = await http.get(Uri.http(serverApi, path, query ));
      print(response.body);

      return json.decode(response.body);
    }else{
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.get("token") as String?;
      if (token == null){
        throw Exception("user is not authenticated");
      }
      final response = await http.get(Uri.http(serverApi, path), headers: {
          "Authorization": "Bearer " + token,
      });
      return json.decode(response.body);
    }

  }

  static Future<dynamic> delete (String path, bool shouldBeAuth) async {
    if(!shouldBeAuth){
      final response = await http.delete(Uri.http(serverApi, path));
      return json.decode(response.body);
    }else{
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.get("token") as String?;
      if (token == null){
        throw Exception("user is not authenticated");
      }
      final response = await http.delete(Uri.http(serverApi, path), headers: {
        "Authorization": "Bearer " + token,
      });
      return response.body;
    }

  }

    static Future<dynamic> post (String path, bool shouldBeAuth, body) async {
    if(!shouldBeAuth){
      final response = await http.post(Uri.http(serverApi, path), body: body);
      print(response.body);
      return json.decode(response.body);
    }else{
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.get("token") as String?;
      if (token == null){
        throw Exception("user is not authenticated"); 
      }
      final response = await http.post(Uri.http(serverApi, path), body: jsonEncode(body), headers: {
          "Authorization": "Bearer " + token,
          'Content-Type': 'application/json; charset=UTF-8',

      });
      print(response.body);
      return json.decode(response.body);
    }

  }

  static Future<dynamic> put (String path, bool shouldBeAuth, body) async {
    if(!shouldBeAuth){
      final response = await http.put(Uri.http(serverApi, path), body: body);
      print(response.body);
      return json.decode(response.body);
    }else{
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.get("token") as String?;
      if (token == null){
        throw Exception("user is not authenticated");
      }
      final response = await http.put(Uri.http(serverApi, path), body: jsonEncode(body), headers: {
        "Authorization": "Bearer " + token,
        'Content-Type': 'application/json; charset=UTF-8',

      });
      print(response.body);
      return response.body;
    }

  }

  static patch (String path, bool shouldBeAuth, Map<String, dynamic> body) async {
    if(!shouldBeAuth){
      final response = await http.patch(Uri.http(serverApi, path), body: body);
      print(response.body);
      return json.decode(response.body);
    }else{
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.get("token") as String?;
      if (token == null){
        throw Exception("user is not authenticated");
      }
      final response = await http.patch(Uri.http(serverApi, path), body: body, headers: {
        "Authorization": "Bearer " + token
      });
      return json.decode(response.body);
    }

  }

  static Future<http.Response> multipartPost (String path, bool shouldBeAuth, body, image) async {
    http.MultipartRequest request = http.MultipartRequest('Post', Uri.http(serverApi, path));
    request.fields.addAll(body);
    request.files.add(
      http.MultipartFile.fromBytes('image', image["body"], filename: image["name"], contentType: MediaType('image', image['mediaType']))
    );
    if(shouldBeAuth){
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.get("token") as String?;
      if (token == null){
        throw Exception("user is not authenticated");
      }
      request.headers["Authorization"] = "Bearer " + token;

    }
    var response = await request.send();
    return await http.Response.fromStream(response);
  }





}