import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/shared/database/database.dart';
import 'package:todo_list/shared/database/sqflite_database.dart';

import 'sqflite_database_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Database>()])
void main() {
  group('SqfliteDatabase', () {
    late final ApiDB dbApi;
    late final MockDatabase database;
    final resultList = [
      {
        'id': '1',
        'title': 'Test',
        'description': 'Test description',
        'isDone': 0,
        'createdAt': DateTime.now().toIso8601String()
      },
      {
        'id': '2',
        'title': 'Test 2',
        'description': 'Test description 2',
        'isDone': 1,
        'createdAt': DateTime.now().toIso8601String()
      }
    ];
    setUpAll(() {
      database = MockDatabase();
      dbApi = SqfliteDatabase(database);
    });

    test('fetchById', () async {
      var id = '';
      when(database.query(any,
              where: anyNamed('where'), whereArgs: anyNamed('whereArgs')))
          .thenAnswer(
              (_) async => [resultList.firstWhere((e) => e['id'] == id)]);

      id = '1';
      var map = await dbApi.fetchById('', id);
      expect(map['id'], equals('1'));
      expect(map['title'], equals('Test'));
      expect(map['description'], equals('Test description'));
      expect(map['isDone'], equals(0));
      expect(map['createdAt'], isA<String>());

      id = '2';
      map = await dbApi.fetchById('', id);
      expect(map.length, equals(5));

      id = '3';
      map = await dbApi.fetchById('', id);
      expect(map, equals({}));
    });
  });
}
