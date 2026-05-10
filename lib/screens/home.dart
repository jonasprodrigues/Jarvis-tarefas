import 'package:flutter/material.dart';
import '../services/task_service.dart';
import '../models/task.dart';
import '../services/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    NotificationService.init();
    _simulateBackground();
  }

  void _simulateBackground() async {
    Future.delayed(const Duration(seconds: 5), () {
      NotificationService.show(
        "Jarvis",
        "Sistema rodando em segundo plano"
      );
    });
  }

  void _addTask() {
    TaskService.addTask(
      Task(title: "Nova tarefa", time: DateTime.now())
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jarvis Offline V2")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _addTask,
            child: const Text("Adicionar tarefa"),
          ),
          Expanded(
            child: ListView(
              children: TaskService.getTasks().map((t) {
                return ListTile(
                  title: Text(t.title),
                  subtitle: Text(t.time.toString()),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}