import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import '../firebase/firebase.dart';
import '../taskModel.dart';

class ListProvider extends ChangeNotifier{
  List<TaskModel>taskList=[];
  DateTime selectedDate = DateTime.now();
  String nameTask = '';
  String description = '';


  Future<void> getAllTasksFromFireStore() async {
    QuerySnapshot<TaskModel> querySnapshot = await FirebaseFunctions.getTasksCollection().get();
    taskList =  querySnapshot.docs.map((doc) {
      return  doc.data();
    }).toList();
   taskList = taskList.where((task){
      if(selectedDate.day==task.date!.day&&
          selectedDate.month==task.date!.month&&
          selectedDate.year==task.date!.year){
        return true;
      }
      return false;
    }).toList();
   taskList.sort((task1, task2) {
    return task1.date!.compareTo(task2.date!);
   },);
   notifyListeners();

  }

  void changeSelecteDate (DateTime newSelectDate){
    selectedDate =newSelectDate;
    getAllTasksFromFireStore();
  }
  void setTitle (String task){
    nameTask= task;
  }
  void setDescription (String descr){
    description=descr;
  }
  String getTitle (){
    return nameTask;
  }
  String getDescription (){
    return description;
  }
}