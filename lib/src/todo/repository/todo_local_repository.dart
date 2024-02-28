import 'package:todo_list/src/todo/model/todo_model.dart';
import 'package:todo_list/src/todo/repository/todo_repository.dart';

class TodoLocalRepository implements TodoRepository {
  @override
  Future<TodoModel> createTodo(TodoModel todo) {}

  @override
  Future<List<TodoModel>> fetchTodos() {}

  @override
  Future<bool> removeTodoById(String id) {}

  @override
  Future<TodoModel> updateTodoById(String id, TodoModel todo) {}
}
