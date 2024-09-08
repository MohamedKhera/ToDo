import 'package:flutter/material.dart';
import 'package:todo/ui/home/widgets/todo_widget.dart';

class TasksTab extends StatelessWidget {
  static const String routeName = "Task";
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(33.0),
      child: ListView.separated(
          itemBuilder: (context,index)=> ToDoWidget(),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: 4
       ),
    );
  }
}
