import 'package:todo_list/src/todo/model/todo_model.dart';
import 'package:todo_list/src/todo/repository/todo_repository.dart';

class TodoLocalRepository implements TodoRepository {
  @override
  Future<TodoModel> createTodo(TodoModel todo) {
    return Future.value(todo);
  }

  @override
  Future<List<TodoModel>> fetchTodos() {
    return Future.value([]);
  }

  @override
  Future<bool> removeTodoById(String id) {
    return Future.value(true);
  }

  @override
  Future<TodoModel> updateTodoById(String id, TodoModel todo) {
    return Future.value(todo);
  }
}
