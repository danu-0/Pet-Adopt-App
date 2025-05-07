import 'dart:convert';

import 'package:http/http.dart' as http;
import '/data/api/model.dart';

class Service {
  final String base_url = "https://pet-be-eight.vercel.app/api";

  Future<List<User>> fetchUser() async {
    try {
      final response = await http.get(Uri.parse("${base_url}/user"));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<User> Users =
            data.map((dynamic item) => User.fromJson(item)).toList();
        return Users;
      } else {
        throw Exception("failed to get data");
      }
    } catch (e) {
      throw Exception('err');
    }
  }

  Future<void> createUser(String name, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("${base_url}/user/register"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "name": name,
          "email": email,
          "password": password,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print("Register success: ${data['message']}, ID: ${data['userId']}");
      } else {
        throw Exception("failed to get data: ${response.body}");
      }
    } catch (e) {
      throw Exception('err');
    }
  }

  Future<http.Response> loginUser(String email, String password) async {
    final url = Uri.parse("${base_url}/user/login");
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      return response;
    } catch (e) {
      throw Exception('err');
    }
  }

  Future<List<Pet>> fetchPet() async {
    try {
      final response = await http.get(Uri.parse("${base_url}/pets"));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Pet> pets =
            data.map((dynamic item) => Pet.fromJson(item)).toList();
        return pets;
      } else {
        throw Exception("failed to get data");
      }
    } catch (e) {
      throw Exception('err');
    }
  }
}
