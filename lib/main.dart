import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mugs_todo/notification_helper.dart';
import 'package:mugs_todo/pages/home_page.dart';
import 'controllers/task_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskController()); // Initialize GetX Controller
    return GetMaterialApp(
      title: 'Life Todo',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
