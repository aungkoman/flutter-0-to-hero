import 'package:flutter/material.dart';
import 'package:zerohero/toToListApp/task.dart';

class ToDoListAppPage extends StatefulWidget {
  const ToDoListAppPage({super.key});

  @override
  State<ToDoListAppPage> createState() => _ToDoListAppPageState();
}

class _ToDoListAppPageState extends State<ToDoListAppPage> {
  final TextEditingController _tec = TextEditingController();
  // state
  List<Task> tasks = [
    Task(title: "Task One", isDone: false),
    Task(title: "Task Two", isDone: false),
    Task(title: "Task Three", isDone: false),
    Task(title: "Task Four", isDone: false),
    Task(title: "Task Five", isDone: false),
    Task(title: "Task One", isDone: false),
    Task(title: "Task Two", isDone: false),
    Task(title: "Task Three", isDone: false),
    Task(title: "Task Four", isDone: false),
    Task(title: "Task Five", isDone: false),
    Task(title: "Task One", isDone: false),
    Task(title: "Task Two", isDone: false),
    Task(title: "Task Three", isDone: false),
    Task(title: "Task Four", isDone: false),
    Task(title: "Task Five", isDone: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: Column(
        children: [
          // text input
          TextField(
            controller: _tec,
            decoration: const InputDecoration(
              hintText: "Enter task ...",
              border: OutlineInputBorder()
            ),
            onSubmitted: (String inputValue) {
              print("TextField.onSubmitted");
              print(inputValue);
              // TODO: add to task list , clear text input

              Task newTask = Task(title: inputValue, isDone: false);
              setState(() {
                tasks.insert(0, newTask);
              });
              _tec.clear();
            },
          ),
          // tasks list
          Expanded(child: ListView(
            children: tasks.map((task) {
              return ListTile(title: Text(task.title),);
            }).toList(),
          ))

        ],
      ),
    );
  }
}
