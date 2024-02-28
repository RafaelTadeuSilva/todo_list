import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/src/todo/model/todo_model.dart';

void main() {
  group('Todo Model', () {
    test('toJson', () {
      final model = TodoModel(
        id: '1',
        title: 'Test',
        description: 'Test description',
        isDone: false,
      );
      final json = model.toJson();
      expect(json, {
        'title': 'Test',
        'description': 'Test description',
        'isDone': false,
        'createdAt': model.createdAt?.toIso8601String(),
      });
    });

    test('fromJson', () {
      final json = {
        'id': '1',
        'title': 'Test',
        'description': 'Test description',
        'isDone': false,
        'createdAt': DateTime.now().toIso8601String(),
      };
      final model = TodoModel.fromJson(json);
      expect(model.id, '1');
      expect(model.title, 'Test');
      expect(model.description, 'Test description');
      expect(model.isDone, false);
      expect(model.createdAt, isA<DateTime>());
    });
  });
}
