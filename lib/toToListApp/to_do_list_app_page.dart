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
    Task(title: "Task One", isDone: true),
    Task(title: "Task Two", isDone: false),
    Task(title: "Task Three", isDone: true),
    Task(title: "Task Four", isDone: true),
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
          Expanded(child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                leading: tasks[index].isDone ? Icon(Icons.check_circle) : Icon(Icons.check_circle_outline),
                title: Text(tasks[index].title),
                trailing: IconButton(onPressed: (){
                  setState(() {
                    tasks.removeAt(index);
                  });
                }, icon: Icon(Icons.delete_forever, color: Colors.red,)),
                onTap: (){
                  setState(() {
                    tasks[index].isDone = true;
                  });
                },
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: tasks.length
          )),
          // Expanded(child: ListView(
          //   children: tasks.map((task) {
          //     return ListTile(
          //       leading: task.isDone ? Icon(Icons.check_circle) : Icon(Icons.check_circle_outline),
          //       title: Text(task.title),
          //       onTap: (){
          //
          //       },
          //     );
          //   }).toList(),
          // ))

        ],
      ),
    );
  }
}
