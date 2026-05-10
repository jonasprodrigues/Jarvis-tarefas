class Task {
  String title;
  DateTime time;
  bool done;

  Task({required this.title, required this.time, this.done = false});
}