import 'package:todo_list/src/todo/model/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> fetchTodos();
  Future<TodoModel> createTodo(TodoModel todo);
  Future<bool> removeTodoById(String id);
  Future<TodoModel> updateTodoById(String id, TodoModel todo);
}
