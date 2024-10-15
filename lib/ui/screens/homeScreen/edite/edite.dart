import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/provider/provider.dart';
import '../../../../firebase/firebase.dart';
import '../../../../taskModel.dart';
import '../../../utilites/theme/mytheme.dart';

class Edite extends StatefulWidget {
  static const String routeName = "edite";
  final TaskModel taskModel;

  const Edite({super.key, required this.taskModel});

  @override
  State<Edite> createState() => _EditeState();
}

class _EditeState extends State<Edite> {
  late ListProvider listProvider;
  var selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  late TextEditingController taskController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    taskController = TextEditingController(text: widget.taskModel.title);
    descriptionController = TextEditingController(text: widget.taskModel.description);
    selectedDate = widget.taskModel.date ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ListProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.58,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(30),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Edit Task",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 40,
                color: MyTheme.PrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: taskController,
              decoration: InputDecoration(
                fillColor: MyTheme.PrimaryColor,
                hoverColor: MyTheme.PrimaryColor,
                labelText: "Title",
                suffixIcon: const Icon(Icons.title),
                focusColor: MyTheme.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              cursorColor: MyTheme.PrimaryColor,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Please enter task title";
                }
                return null;
              },
              maxLines: 1,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                hoverColor: MyTheme.PrimaryColor,
                labelText: "Description",
                hintText: "Enter task description",
                suffixIcon: const Icon(Icons.description),
                focusColor: MyTheme.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              cursorColor: MyTheme.PrimaryColor,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Please enter task description";
                }
                return null;
              },
              maxLines: 2,
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Select Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            InkWell(
              onTap: () {
                showCalendar();
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
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
                  editTask();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: MyTheme.PrimaryColor,
                ),
                child: Text(
                  "Edit",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
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

  void editTask() {
    if (formKey.currentState?.validate() == true) {
      widget.taskModel.title = taskController.text;
      widget.taskModel.description = descriptionController.text;
      widget.taskModel.date = selectedDate;


       FirebaseFunctions.updateTask(widget.taskModel);
        listProvider.getAllTasksFromFireStore();
    }
  }
}
