import 'dart:convert';

List<Todo> todoFromJson(String str) =>
  List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todosToJson(List<Todo> data) => 
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
  int userId;
  int id;
  String title;
  bool completed;


  Todo({ 
    this.userId, 
    this.id, 
    this.title,
    this.completed 
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    userId: json['userId'],
    id: json['id'],
    title: json['title'],
    completed: json['completed']
  );

  Map<String, dynamic> toJson() => {    
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed
  };
}