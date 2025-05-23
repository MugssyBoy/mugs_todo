import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mugs_todo/pages/add_task_page.dart';
import 'package:mugs_todo/controllers/task_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Life Todo'), centerTitle: true),
      body: Obx(() {
        if (controller.tasks.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.inbox, size: 100, color: Colors.grey),
                SizedBox(height: 16),
                Text('No todos available', style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (context, index) {
            final task = controller.tasks[index];
            return Card(
              color: task.isCompleted ? Colors.blue[100] : Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(task.title),
                subtitle: Text(task.description),
                leading: Icon(
                  task.isCompleted ? Icons.check_circle : Icons.circle_outlined,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        task.isCompleted ? Icons.undo : Icons.check,
                        color: Colors.green,
                      ),
                      onPressed: () => controller.toggleTask(index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => controller.removeTask(index),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddTaskPage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
