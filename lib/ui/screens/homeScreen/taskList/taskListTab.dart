import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/firebase/firebase.dart';
import 'package:todo_task/ui/screens/homeScreen/taskList/todo_Item.dart';
import 'package:todo_task/ui/utilites/theme/mytheme.dart';

import '../../../../taskModel.dart';

class TaskList extends StatefulWidget {

   TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<TaskModel>taskList=[];

  String description="";

  String nameTask="";

  @override
  Widget build(BuildContext context) {
    if(taskList.isEmpty){
      getAllTasksFromFireStore();
    }

    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .13,
              color: MyTheme.PrimaryColor,
            ),
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                //`selectedDate` the new date selected.
              },
              headerProps: const EasyHeaderProps(
                monthPickerType: MonthPickerType.switcher,
                dateFormatter: DateFormatter.fullDateDMY(),
                monthStyle: TextStyle(color: Colors.white,fontSize: 25,backgroundColor: MyTheme.PrimaryColor),
                selectedDateStyle: TextStyle(color: Colors.white,fontSize: 20)

              ),
              dayProps: const EasyDayProps(
                borderColor: Colors.white,
                todayHighlightColor: MyTheme.PrimaryColor,
                todayStyle: DayStyle(dayStrStyle: TextStyle(color: Colors.white,fontSize: 25,)),
                todayHighlightStyle: TodayHighlightStyle.withBackground,
                dayStructure: DayStructure.dayStrDayNum,
                activeDayStyle: DayStyle(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        MyTheme.PrimaryColor,
                        Color(0xff0033ff),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),

        Expanded(
          child: Container(
            margin: EdgeInsets.all(20),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TodoItem(taskModel: taskList[index] ,);
              },
               itemCount:taskList.length ,
              ),
          ),
        ),

      ],
    );
  }

  Future<void> getAllTasksFromFireStore() async {
    QuerySnapshot<TaskModel> querySnapshot = await FirebaseFunctions.getTasksCollection().get();
    taskList =  querySnapshot.docs.map((doc) {
    return  doc.data();
    }).toList();
    setState(() {

});

  }
}
