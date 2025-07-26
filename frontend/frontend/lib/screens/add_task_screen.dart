import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/api_service.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Title')),
            TextField(controller: descriptionController, decoration: const InputDecoration(labelText: 'Description')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final newTask = Task(id: 0, title: titleController.text, description: descriptionController.text);
                await ApiService.addTask(newTask);
                Navigator.pop(context);
              },
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}