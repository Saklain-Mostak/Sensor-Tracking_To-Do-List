import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/controller/controller1.dart';
import 'package:todo/screen/todo_screen/home_screen.dart';

class DeleteScreen1 extends StatelessWidget {
  final int index;
  const DeleteScreen1({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());
    final task = taskController.taskList[index];
    String formattedDate = DateFormat("dEEEE,MMMM").format(task.dueDate);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.off(() => const HomePage());
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          textAlign: TextAlign.start,
          task.title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.alarm),
                      Text(
                        " Remind Me!",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Color(0xFF33CCCC),
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                            fontSize: 18, color: Color(0xFF33CCCC)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.note),
                      Text(
                        " Add Note",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: "Warning",
                    middleText: "${task.title} permanently delete!" ,
                    textConfirm: "Delete Task",
                    textCancel: "Cancel",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      taskController.removeTask(index);
                      Get.off(() => const HomePage());
                    },
                    onCancel: () {
                     Get.off(() => DeleteScreen1(index: index,));
                    },
                  );
                },
                child: const SizedBox(
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      SizedBox(width: 11),
                      Text(
                        'Delete',
                        style: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                          letterSpacing: 0.10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
