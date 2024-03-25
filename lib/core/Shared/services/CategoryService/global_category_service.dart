import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../../../base_url.dart';
import '../../../Entity/task_category.dart';


class GlobalCategoryService{
  Future<List<TaskCategory>> fetchAllCategories() async {
    try {
      Response response = await http.get(Uri.parse("$baseUrl/categories"));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((category) => TaskCategory.fromJson(category)).toList();
      } else {
        throw Exception('Failed to load category');
      }
    } catch (error) {
      print('Error in fetchAllCategories: $error');
      rethrow;
    }
  }
  Future<TaskCategory>addCategory(String categoryName)async{
    final headers = {'Content-Type': 'application/json'};
    TaskCategory addedCategory=TaskCategory(categoryId: "", categoryName: "");

    try{
      final body=jsonEncode({'categoryName':categoryName});
      print("body $body");
      Response response=await http.post(Uri.parse("$baseUrl/categories/addCategory"),headers: headers,body: body);
      if(response.statusCode==200){
        print('category added successfully');


        final Map<String, dynamic> responseData = jsonDecode(response.body);
        addedCategory = TaskCategory.fromJson(responseData);
        return addedCategory;
      }
      else{
        print('Failed to add category. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return addedCategory;
      }
    }catch(error){
      print('Exception during task addition: $error');
      return addedCategory;
    }

  }
  Future<String> deleteCategory(TaskCategory category) async {
    final headers = {'Content-Type': 'application/json'};
    try {
      final body = jsonEncode(category.toJson());
      final url = Uri.parse("$baseUrl/categories/deleteCategory");

      final response = await http.delete(url, headers: headers,body: body);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'Failed to delete category: ${response.body}';
      }
    } catch (error) {
      return 'Error deleting category: $error';
    }
  }
  Future<String>updateCategory(TaskCategory taskCategory)async{
    final headers = {'Content-Type': 'application/json'};
    try {
      final body = jsonEncode(taskCategory.toJson());
      final url = Uri.parse("$baseUrl/categories/updateCategory");

      final response = await http.patch(url, headers: headers,body: body);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'Failed to update category: ${response.body}';
      }
    } catch (error) {
      return 'Error deleting category: $error';
    }
  }

}