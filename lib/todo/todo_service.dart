import 'package:flutter/cupertino.dart';
import 'package:guidedtour/todo/todo_model.dart';

class TodoService {
  final ValueNotifier<List<String>> _todos = ValueNotifier<List<String>>([]);

  void addTodo(String todo) {
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: todo,
    );
    todoNotifier.value = [...todoNotifier.value, newTodo.title];
  }

  void TodoToggle(String id) {
    final index = todoNotifier.value.indexWhere((todo) => todo == id);
    if (index != -1) {
      final updatedTodo = Todo(
        id: id,
        title: todoNotifier.value[index],
        isCompleted: !Todo(
          id: id,
          title: todoNotifier.value[index],
        ).isCompleted,
      );
      final updatedTodos = List<String>.from(todoNotifier.value);
      updatedTodos[index] = updatedTodo.title;
      todoNotifier.value = updatedTodos;
    }
  }
}
