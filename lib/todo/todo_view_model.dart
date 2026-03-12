import 'package:flutter/cupertino.dart';
import 'package:guidedtour/todo/todo_model.dart';
import 'package:guidedtour/todo/todo_service.dart';

class TodoViewModel {
  TodoViewModel ({})
    : _todoService = TodoService();

  final TodoService _todoService;
  ValueNotifier<List<Todo>> get todos => _todoService.todoNotifier;

  void addTodo(String title) {
    final trimmed = title.trim();
    if ((trimmed.isNotEmpty) {
      _todoService.addTodo(trimmed);
    }
  }

    void toggleTodo(String id) {
      _todoService.TodoToggle(id);
    }

    void dispose() {
      // _todoService.dispose();
    }

}