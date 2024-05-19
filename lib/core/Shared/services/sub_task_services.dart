import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:todo_app/base_url.dart';

import '../../DTO/subTaskDTO.dart';

class SubTaskServices{

  Future<String>updateSubTask(SubTaskDTO subTaskDTo)async{
    try{
      Response response=await http.patch(Uri.parse('$baseUrl/subTask/updateSubTask'),headers: {
        'Content-Type': 'application/json',

      },
      body: jsonEncode(subTaskDTo.toJson()));
      if(response.statusCode==200){
          return response.body;
      }
      else
        {
          throw Exception('here ${response.body} ');
        }
    }catch(error){
        return Future.error((error));
    }
  }
  Future<int> updateSubTaskProgress(SubTaskDTO subTaskDTO)async{
    try{
      Response response=await http.patch(Uri.parse('$baseUrl/subTask/updateSubTaskProgress'),headers: {
        'Content-Type': 'application/json',

      },
          body: jsonEncode(subTaskDTO.toJson()));
      if(response.statusCode==200){
        return int.parse(response.body)  ;
      }
      else
      {
        throw Exception('here ${response.body} ');
      }
    }catch(error){
      return Future.error((error));
    }
  }

}