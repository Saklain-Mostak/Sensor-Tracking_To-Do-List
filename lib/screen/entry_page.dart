import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/controller1.dart';
import 'package:todo/screen/sensor_tracking/sensor_tracking_screen.dart';

import 'package:todo/screen/todo_screen/todo_screen1.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  final TaskController controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => const TodoApp());
                },
                child: Container(
                  width: 328,
                  height: 76,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xFF36E0E0),
                      borderRadius: BorderRadius.circular(16)),
                  child: const Center(
                    child: Text(
                      'A To-Do List',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.05,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () {Get.off(()=>SensorDataGraphPage());},
                child: Container(
                  width: 328,
                  height: 76,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xFF3E68FF),
                      borderRadius: BorderRadius.circular(16)),
                  child: const Center(
                    child: Text(
                      'Sensor Tracking',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.05,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
