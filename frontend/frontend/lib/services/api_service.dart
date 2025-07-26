import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8080/api/tasks'; // Android emulator localhost

  static Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  static Future<void> addTask(Task task) async {
    await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(task.toJson()));
  }

  static Future<void> updateTask(int id, Task task) async {
    await http.put(Uri.parse('\$baseUrl/\$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(task.toJson()));
  }

  static Future<void> deleteTask(int id) async {
    await http.delete(Uri.parse('\$baseUrl/\$id'));
  }
}