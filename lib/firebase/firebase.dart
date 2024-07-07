import 'package:cloud_firestore/cloud_firestore.dart';

import '../taskModel.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance.collection(TaskModel.collectionName).withConverter<TaskModel>(
      fromFirestore: (snapshot, options) => TaskModel.fromJson(snapshot.data()!),
      toFirestore: (task, options) => task.toJson(),
    );
  }

  static Future<void> addTask(TaskModel taskModel) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    taskModel.id = docRef.id;
    print("Adding Task to Firestore: ${taskModel.toJson()}");
    return docRef.set(taskModel).then((value) {
      print("Task added successfully in Firebase");
    }).catchError((error) {
      print("Failed to add task in Firebase: $error");
      throw error;
    });
  }
}