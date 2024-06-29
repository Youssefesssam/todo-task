import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      margin: const EdgeInsets.all(40),
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
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      onChanged: (text) {
                        nameTask = text;
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "please enter task title";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: "Enter new task",
                          labelStyle: TextStyle(
                            color: MyTheme.black,
                            fontSize: 20,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      onChanged: (text) {
                        description = text;
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "please enter task description";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Enter task description",
                        labelStyle: TextStyle(
                          color: MyTheme.black,
                          fontSize: 20,
                        ),
                      ),
                      maxLines: 4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Select Date',
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: InkWell(
                        onTap: () {
                          ShowCalender();
                        },
                        child: Text(
                          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.50,
                      height: 30,
                      decoration: BoxDecoration(
                          color: MyTheme.PrimaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: InkWell(
                              onTap: () {
                                addTask();
                              },
                              child: Text(
                                "Add",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontSize: 25),
                              ))),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  void ShowCalender() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 1825)),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
    }
    setState(() {});
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {}
  }
}
