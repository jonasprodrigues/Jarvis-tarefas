import '../models/task.dart';

class TaskService {
  static List<Task> tasks = [];

  static void addTask(Task task) {
    tasks.add(task);
  }

  static List<Task> getTasks() {
    return tasks;
  }
}