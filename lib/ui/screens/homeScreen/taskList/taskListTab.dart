import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/ui/screens/homeScreen/taskList/todoItem.dart';
import 'package:todo_task/ui/utilites/theme/mytheme.dart';

class TaskList extends StatelessWidget {
  String description="";
  String nameTask="";
   TaskList({super.key});

  @override
  Widget build(BuildContext context) {
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
              ),
              dayProps: const EasyDayProps(
                dayStructure: DayStructure.dayStrDayNum,
                activeDayStyle: DayStyle(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
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
                return TodoItem(description: description, nameTask: nameTask,);
              },
               itemCount: 50,
              ),
          ),
        ),

      ],
    );
  }
}
