import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:todo_app/core/DTO/Fetch_recent_task.dart';

import '../../../../base_url.dart';

class TaskService {
  Future<List<FetchRecentTaskDTO>> fetchTasks() async {
    try {
      Response response =
          await http.get(Uri.parse('$baseUrl/Task/getRecentTask'));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((task) => FetchRecentTaskDTO.fromJson(task))
            .toList();
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (error) {
      return Future.error(error);
    }
  }
}
