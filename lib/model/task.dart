class Task {
  final String id;
  String title;
  bool isDone;
  final String? createdAt;

  Task({required this.id, required this.title, required this.isDone, this.createdAt});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'] ?? '',
      isDone: json['isDone'] ?? false,
      createdAt: json['createdAt'],
    );
  }
}