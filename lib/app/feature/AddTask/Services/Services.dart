import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/base_url.dart';

import '../../../../core/Entity/task.dart';
import '../Shared/taskDto.dart';

class AddTaskServices {
  Future<Task> addTask(TaskDto taskDTO) async {
    final headers = {'Content-Type': 'application/json'};

    try {
      final body = jsonEncode(taskDTO.toJson());

      final response = await http.post(
        Uri.parse('$baseUrl/Task/addTask'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return Task.fromJson(jsonResponse);
      } else {
        print('Failed to add task. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');

        throw Exception("Failed to add task");
      }
    } catch (e) {
      print('Exception during task addition: $e');
      throw Exception("Failed to add task: $e");
    }
  }
  Future<void> uploadImage(String image,String taskId) async {
    var request = http.MultipartRequest(
        'PATCH',
        Uri.parse('$baseUrl/Task/addImage/$taskId'));
    request.files.add(await http.MultipartFile.fromPath('file', image));

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Failed to upload image. Status code: ${response.statusCode}');
    }
  }
}
