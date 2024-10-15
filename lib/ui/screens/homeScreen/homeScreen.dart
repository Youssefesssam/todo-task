import 'package:flutter/material.dart';
import 'package:todo_task/ui/screens/homeScreen/settingTab/settingTab.dart';
import 'package:todo_task/ui/screens/homeScreen/taskList/addTaskBottomSheet.dart';
import 'package:todo_task/ui/screens/homeScreen/taskList/taskListTab.dart';
import 'package:todo_task/ui/utilites/theme/mytheme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget>tabs=[TaskList(),SettingsTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton: buildContainer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     body: tabs[selectedIndex],
    );
  }


  Container buildContainer() {
    return Container(
      height: 70.0,
      width: 70.0,
      child: FloatingActionButton(
        backgroundColor: MyTheme.PrimaryColor,
          onPressed: () {
            showAddTaskBottomSheet();
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("ToDo List", style: Theme.of(context).textTheme.titleLarge),
      backgroundColor: MyTheme.PrimaryColor,
    );
  }

  ClipRRect buildBottomNavigationBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft:Radius.circular(40) ),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            buildBottomNavigationBarItem(Icons.list, "Task List"),
            buildBottomNavigationBarItem(Icons.settings, "Settings"),
          ],

        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
          IconData icon, String label) => BottomNavigationBarItem(
          icon: Icon(icon,size: 35,), label: label);

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (context)=>Container(
            child: Padding(
              padding:MediaQuery.of(context).viewInsets ,
              child: const AddTaskBottomSheet(),
            ))
    );
  }
}
