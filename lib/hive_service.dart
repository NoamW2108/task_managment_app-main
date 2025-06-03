import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String _tasksBoxName = 'tasksBox';
  static const String _completedTasksBoxName = 'completedTasksBox';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(_tasksBoxName);
    await Hive.openBox<String>(_completedTasksBoxName);
  }

  static Box<String> get _tasksBox => Hive.box<String>(_tasksBoxName);
  static Box<String> get _completedTasksBox =>
      Hive.box<String>(_completedTasksBoxName);

  static List<String> getTasks() {
    return _tasksBox.values.toList();
  }

  static List<String> getCompletedTasks() {
    return _completedTasksBox.values.toList();
  }

  static Future<void> addTask(String task) async {
    await _tasksBox.add(task);
  }

  static Future<void> deleteTask(int index) async {
    await _tasksBox.deleteAt(index);
  }

  static Future<void> addToCompletedTasks(String task) async {
    await _completedTasksBox.add(task);
  }

  static Future<void> clearTasks() async {
    await _tasksBox.clear();
  }

  static Future<void> clearCompletedTasks() async {
    await _completedTasksBox.clear();
  }
}
