import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/controller1.dart';
import 'package:todo/models/hive_model.dart';
import 'package:todo/screen/todo_screen/home_screen.dart';

// ignore: must_be_immutable
class NewTask extends StatelessWidget {
  final TaskController taskController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  late DateTime? dueDate;

  NewTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add New Task"),
          leading: IconButton(
              onPressed: () {
                Get.off(() => const HomePage());
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      labelText: 'Heading', border: OutlineInputBorder())),
              const SizedBox(height: 10),
              TextField(
                  controller: detailsController,
                  decoration: const InputDecoration(
                      labelText: 'Details', border: OutlineInputBorder())),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () async {
                        dueDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                      },
                      icon: const Icon(Icons.date_range)),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[100]),
                onPressed: () {
                  if (titleController.text.isNotEmpty && dueDate != null) {
                    taskController.addTask(Task(
                      title: titleController.text,
                      details: detailsController.text,
                      dueDate: dueDate!,
                    ));
                  }
                  Get.off(() => const HomePage());
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ));
  }
}
