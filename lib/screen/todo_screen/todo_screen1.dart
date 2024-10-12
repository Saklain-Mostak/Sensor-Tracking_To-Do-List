import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo/screen/todo_screen/home_screen.dart';


class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1),(){Get.off(() =>  const HomePage());});
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("image/tasks1.png", height: 130, width: 130),
            const Text(
              'Daily To-Do App',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 21,
                fontFamily: 'Sigmar',
                fontWeight: FontWeight.w400,
                height: 0.05,
              ),
            ),
            const SizedBox(height: 35,),
            CircularProgressIndicator(color: Colors.blue[100],)
          ],
        ),
      ),
    );
  }
}
