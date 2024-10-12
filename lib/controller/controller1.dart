
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo/models/hive_model.dart';

class TaskController extends GetxController {
  var taskList = <Task>[].obs;
  late Box<Task> taskBox;

  @override
  void onInit() {
    super.onInit();
    openBox();
  }

  void openBox() async {
    taskBox = await Hive.openBox<Task>('taskBox');
    taskList.addAll(taskBox.values);
  }

  void addTask(Task task) {
    taskBox.add(task);
    taskList.add(task);
  }

  void removeTask(int index) {
    taskBox.deleteAt(index);
    taskList.removeAt(index);
  }

  void markTaskCompleted(int index) {
    var task = taskList[index];

    task.isCompleted = !task.isCompleted;

    taskBox.putAt(index, task);
    taskList[index] = task;
  }

  void checkDueTasks() {
    for (var task in taskList) {
      if (task.dueDate.day == DateTime.now().day &&
          task.dueDate.month == DateTime.now().month &&
          task.dueDate.year == DateTime.now().year &&
          !task.isCompleted) {
        Get.snackbar('Due Alert', '${task.title} is due today!',
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }
}
