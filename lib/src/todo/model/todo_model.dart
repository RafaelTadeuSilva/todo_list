class TodoModel {
  final String? id;
  final String title;
  final String description;
  final bool isDone;
  final DateTime? createdAt;

  TodoModel({
    this.id,
    required this.title,
    this.description = '',
    this.isDone = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isDone: json['isDone'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'isDone': isDone ? 1 : 0,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
