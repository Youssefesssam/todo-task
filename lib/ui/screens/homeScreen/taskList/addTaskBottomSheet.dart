import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/firebase/firebase.dart';
import 'package:todo_task/provider/provider.dart';
import 'package:todo_task/taskModel.dart';
import 'package:todo_task/ui/utilites/theme/mytheme.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  String nameTask = '';
  String description = '';
late ListProvider listProvider;
  @override
  Widget build(BuildContext context) {
     listProvider = Provider.of<ListProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add new Task",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 30,
              color: MyTheme.black,
            ),
            textAlign: TextAlign.center,
          ),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Task",
                      hintText: "Enter new task",
                      suffixIcon: const Icon(Icons.task_alt_outlined),
                      focusColor: MyTheme.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    cursorColor: MyTheme.PrimaryColor,
                    onChanged: (text) {
                      nameTask = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Please enter task title";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Description",
                      hintText: "Enter task description",
                      suffixIcon: const Icon(Icons.description),
                      focusColor: MyTheme.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    cursorColor: MyTheme.PrimaryColor,
                    onChanged: (text) {
                      description = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Please enter task description";
                      }
                      return null;
                    },
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Select Date',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      showCalendar();
                    },
                    child: Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 20, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      addTask();

                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      primary: MyTheme.PrimaryColor,
                    ),
                    child: Text(
                      "Add",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 25),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void showCalendar() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 1825)),
    );
    if (chosenDate != null) {
      setState(() {
        selectedDate = chosenDate;
      });
    }
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      TaskModel taskModel = TaskModel(
        title: nameTask,
        description: description,
        date: selectedDate,
      );
      FirebaseFunctions.addTask(taskModel).timeout(Duration(milliseconds: 500),onTimeout: (){
        print("task added successfully");
        listProvider.getAllTasksFromFireStore();
        Navigator.pop(context);
      }
      );
    }
  }
}