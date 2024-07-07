import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  static const String collectionName = 'tasks';
  String? id;
  String? title;
  String? description;
  DateTime? date;
  bool? isDone;

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.date,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        date = (json['date'] as Timestamp).toDate(),
        id = json['id'],
        isDone = json['isDone'];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'id': id,
      'isDone': isDone,
    };
  }
}