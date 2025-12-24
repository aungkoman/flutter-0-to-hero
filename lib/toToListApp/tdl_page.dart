import 'package:flutter/material.dart';
import 'package:zerohero/toToListApp/task.dart';

class TdlPage extends StatefulWidget {
  const TdlPage({super.key});

  @override
  State<TdlPage> createState() => _TdlPageState();
}

class _TdlPageState extends State<TdlPage> {

  // Text Editing Controller

  final TextEditingController _tec = TextEditingController();
  // State
  List<Task> tasks = [
    Task(title: "Task One", isDone: false),
    Task(title: "Task Two", isDone: true),
    Task(title: "Task Three", isDone: false),
    Task(title: "Task Four", isDone: false),
    Task(title: "Task Five", isDone: false),
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _tec,
            decoration: const InputDecoration(
              hintText: "Enter task name"
            ),
            onSubmitted: (String inputValue){
              print("TextFiled.onSubmitted");
              print(inputValue);

              Task newTask = Task(title: inputValue, isDone: false);
              setState(() {
                tasks.insert(0,newTask);
              });

              // clear
              _tec.clear();
            },
          ),
          // tasks list
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  leading: tasks[index].isDone ? Icon(Icons.check_circle) :  Icon(Icons.check_circle_outline),
                  title: Text(tasks[index].title),
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: tasks.length
            ),
          )
        ],
      ),
    );
  }
}
