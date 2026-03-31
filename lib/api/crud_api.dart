import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../model/task.dart';

class CrudApi extends StatefulWidget {
  const CrudApi({super.key});

  @override
  State<CrudApi> createState() => _CrudApiState();
}

class _CrudApiState extends State<CrudApi> {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://telegram-813434308498.asia-southeast1.run.app',
    ),
  );
  List<Task> _tasks = [];
  bool _isLoading = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  // GET: Fetch all tasks
  Future<void> _fetchTasks() async {
    setState(() => _isLoading = true);
    try {
      final response = await _dio.get('/api/tasks');
      final List data = response.data;
      setState(() {
        _tasks = data.map((json) => Task.fromJson(json)).toList();
      });
    } catch (e) {
      _showError("Failed to load tasks");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // POST: Add new task
  Future<void> _addTask() async {
    if (_controller.text.isEmpty) return;
    try {
      await _dio.post(
        '/api/tasks',
        data: {'title': _controller.text, 'isDone': false},
      );
      _controller.clear();
      _fetchTasks(); // Refresh list
    } catch (e) {
      _showError("Failed to add task");
    }
  }

  // PUT: Toggle isDone
  Future<void> _toggleTask(Task task) async {
    try {
      await _dio.put('/api/tasks/${task.id}', data: {'isDone': !task.isDone});
      _fetchTasks();
    } catch (e) {
      _showError("Update failed");
    }
  }

  // DELETE: Remove task
  Future<void> _deleteTask(String id) async {
    try {
      await _dio.delete('/api/tasks/$id');
      _fetchTasks();
    } catch (e) {
      _showError("Delete failed");
    }
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'New Task...'),
                  ),
                ),
                IconButton(icon: const Icon(Icons.add), onPressed: _addTask),
              ],
            ),
          ),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      final task = _tasks[index];
                      return ListTile(
                        leading: Checkbox(
                          value: task.isDone,
                          onChanged: (_) => _toggleTask(task),
                        ),
                        title: Text(
                          task.title,
                          style: TextStyle(
                            decoration: task.isDone
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        subtitle: Text(task.createdAt ?? ""),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteTask(task.id),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
