import 'package:flutter/material.dart';
import 'package:todo_list/src/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final database = runApp(const MyApp());
}
