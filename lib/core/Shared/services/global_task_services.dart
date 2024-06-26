import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:todo_app/core/Entity/task.dart';

import '../../../base_url.dart';
import '../../DTO/dailyTaskDto.dart';
import '../../DTO/task_update_request.dart';

class GlobalTaskServices {
  Future<List<Task>> fetchTasks() async {
    try {
      Response response =
          await http.get(Uri.parse('$baseUrl/Task/getAllTasks'));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((task) => Task.fromJson(task)).toList();
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<String> updateTaskStatus(TaskUpdateRequest updateRequest) async {
    try {
      final url = Uri.parse('$baseUrl/Task/updateStatus');
      final response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(updateRequest.toJson()),
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception(
            'Failed to update task status. Status Code: ${response.statusCode}, Response Body: ${response.body}');
      }
    } catch (error) {
      throw Exception('Failed to update task status. Error: $error');
    }
  }

  Future<String> deleteTask(String taskId) async {
    try {
      final Map<String, dynamic> requestBody = {'taskId': taskId};

      final url = Uri.parse('$baseUrl/Task/deleteTask');
      final response = await http.delete(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(requestBody));
      if (response.statusCode == 200) {
        return "Task deleted successfully";
      } else {
        return "Failed to delete task. Status code: ${response.statusCode}";
      }
    } catch (error) {
      return "Exception occurred: $error";
    }
  }

  Future<String> updateTask(Task task) async {
    const String url = "$baseUrl/Task/updateTask";
    final Map<String, dynamic> requestBody = task.toJson();
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "Failed to update task. Status code: ${response.statusCode}";
      }
    } catch (error) {
      return "Exception occurred: $error";
    }
  }
  Future<Task> addDailyTask(DailyTaskDTO dailyTaskDTO) async {
    final headers = {'Content-Type': 'application/json'};

    try {
      final body = jsonEncode(dailyTaskDTO.toJson());

      final response = await http.post(
        Uri.parse('$baseUrl/Task/addDailyTask'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return Task.fromJson(jsonResponse);
      } else {
        print('Failed to add task. Status code: ${response.statusCode}');

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
  Future<bool>resetDailyTask()async{
    try{
      final response=await http.put(Uri.parse('$baseUrl/Task/resetDailyTask'));
      if (response.statusCode==200) {
          return true;
      }
      else {
        return false;
      }

    }catch(e){
      return false;
    }


  }


}
