import 'package:flutter/material.dart';

class ToDoListAppPage extends StatefulWidget {
  const ToDoListAppPage({super.key});

  @override
  State<ToDoListAppPage> createState() => _ToDoListAppPageState();
}

class _ToDoListAppPageState extends State<ToDoListAppPage> {
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
            decoration: const InputDecoration(
              hintText: "Enter task ...",
              border: OutlineInputBorder()
            ),
            onSubmitted: (String inputValue) {
              print("TextField.onSubmitted");
              print(inputValue);
            },
          ),
          // tasks list

        ],
      ),
    );
  }
}
