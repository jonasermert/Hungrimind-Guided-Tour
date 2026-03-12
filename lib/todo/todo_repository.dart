import 'dart:convert';

import 'package:guidedtour/todo/todo_model.dart';

import '../core/utils/http/http_abstraction.dart';

class TodoRepository {
  TodoRepository({required HttpAbstraction httpAbstraction})
    : _httpAbstraction = httpAbstraction;

  final HttpAbstraction _httpAbstraction;

  Future<List<Todo>> fetchTodos() async {
    try {
      final response = await _httpAbstraction.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((json) => Todo.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load todos: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
