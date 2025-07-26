import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/api_service.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;
  const EditTaskScreen({Key? key, required this.task}) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    descriptionController = TextEditingController(text: widget.task.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Title')),
            TextField(controller: descriptionController, decoration: const InputDecoration(labelText: 'Description')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final updatedTask = Task(
                  id: widget.task.id,
                  title: titleController.text,
                  description: descriptionController.text,
                );
                await ApiService.updateTask(widget.task.id, updatedTask);
                Navigator.pop(context);
              },
              child: const Text('Update'),
            )
          ],
        ),
      ),
    );
  }
}