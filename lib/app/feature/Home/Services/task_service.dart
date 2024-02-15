import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../../../../core/Entity/Task.dart';

class TaskService{
  Future<List<Task>> fetchTasks() async {
    Response response =
    await http.get(Uri.parse('http://192.168.100.16:8080/Task/getAllTasks'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      print('HTTP Status Code: ${response.statusCode}');
      return jsonResponse.map((task) => Task.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}