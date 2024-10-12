import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/controller1.dart';
import 'package:todo/screen/detete_screen/delete_screen1.dart';
import 'package:todo/screen/new_task/newtask.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  width: 329,
                  height: 51,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(child: Image.asset("image/tasks1.png")),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Zoyeb Ahmed',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0.06,
                              ),
                            ),
                            Text(
                              '5 incomplete, 5 completed',
                              style: TextStyle(
                                color: Color(0xFF575767),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0.10,
                                letterSpacing: 0.10,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      const Center(
                          child: Icon(
                        Icons.search,
                        size: 24,
                      )),
                    ],
                  ),
                ),
                const Divider(),
                Obx(() => Expanded(
                        child: ListView.builder(
                      itemCount: taskController.taskList.length,
                      itemBuilder: (context, index) {
                        final task = taskController.taskList[index];
                        String formattedDate =
                            DateFormat("dEEEE,MMMM").format(task.dueDate);

                        return Card(
                          child: ListTile(
                              title: Text(
                                task.title,
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    task.details,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    formattedDate,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              trailing: task.isCompleted
                                  ? const Icon(Icons.check_box,
                                      color: Colors.green)
                                  : const Icon(Icons.check_box_outline_blank),
                              onTap: () =>
                                  taskController.markTaskCompleted(index),
                              onLongPress: () =>

                                  //  taskController.removeTask(index),

                                  Get.off(() => DeleteScreen1(index: index))),
                        );
                      },
                    ))),
              ],
            )),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xff33CCCC),
            child: const Icon(Icons.add),
            onPressed: () {
              Get.off(() => NewTask());
            }),
      ),
    );
  }
}
