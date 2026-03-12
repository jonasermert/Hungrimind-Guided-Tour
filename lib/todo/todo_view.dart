import 'package:flutter/material.dart';
import 'package:guidedtour/todo/todo_model.dart';
import 'package:guidedtour/todo/todo_service.dart';
import 'package:guidedtour/todo/todo_view_model.dart';

import '../core/ui/app_theme.dart';
import '../core/utils/locator.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  late final TodoViewModel _viewModel;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel = TodoViewModel(
      todoService: locator<TodoService>(),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: ValueListenableBuilder<List<Todo>>(
        valueListenable: _viewModel.todos,
        builder: (context, todos, _) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(context.spacing.md),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: const InputDecoration(
                          hintText: 'Add a new todo...',
                        ),
                      ),
                    ),
                    SizedBox(width: context.spacing.sm),
                    ElevatedButton(
                      onPressed: () {
                        _viewModel.addTodo(_textController.text);
                        _textController.clear();
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return ListTile(
                      title: Text(
                        todo.title,
                        style: todo.isCompleted
                            ? TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: context.kitColors.neutral500,
                              )
                            : null,
                      ),
                      leading: Checkbox(
                        value: todo.isCompleted,
                        onChanged: (_) => _viewModel.toggleTodo(todo.id),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
