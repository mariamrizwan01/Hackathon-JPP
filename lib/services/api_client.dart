import 'dart:convert';
import 'dart:developer';
import 'package:hackathon/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl = 'http://192.168.42.119:8080';

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/user'));
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      log(jsonResponse.toString());
      return jsonResponse.map((item) => User.fromJson(item)).toList();
    } else {
      log(response.statusCode.toString());
      throw Exception('Failed to load users');
    }
  }

  Future<List<Tasks>> getTasks(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$id/tasks'));
    log(response.statusCode.toString());
    log(response.body);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      log(jsonResponse.toString());
      return jsonResponse.map((item) => Tasks.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<User> updateUser(String id, User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/user/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/user/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }

  Future<void> putNewTask(String id, Tasks task) async {
    log(id);
    log("new task add process");
    final response = await http.put(
      Uri.parse('$baseUrl/user/$id/tasks'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // Wrap task.toJson() in an array
      body: jsonEncode([task.toJson()]),
    );
    if (response.statusCode != 200) {
      log("new task add process failed");
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');
      throw Exception('Failed to add task');
    }
  }
}
