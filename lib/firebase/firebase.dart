
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
    return docRef.set(taskModel).then((value) {
      print("Task added successfully in Firebase");
    }).catchError((error) {
      print("Failed to add task in Firebase: $error");
      throw error;
    });
  }

  static Future<void> delete(TaskModel taskModel){
    return getTasksCollection().doc(taskModel.id).delete();

  }
  static Future<void> updateTask(TaskModel taskModel){
    return getTasksCollection().doc(taskModel.id).update({
    'title': taskModel.title,
    'description': taskModel.description,
    'date': taskModel.date,
    'isDone': taskModel.isDone,
    });


  }

}