import 'package:get/get.dart';
import 'package:mugs_todo/models/task_model.dart';

class TaskController extends GetxController {
  RxList<Task> tasks = <Task>[].obs;

  void addTask(Task task) {
    tasks.add(task);
  }

  void toggleTask(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks.refresh();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }
}
