import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton: buildContainer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }


  Container buildContainer() {
    return Container(
      height: 70.0,
      width: 70.0,
      child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
          ),
        ),
      );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.18,
      title: Text("ToDo List", style: Theme.of(context).textTheme.titleLarge),
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
}
