import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoItem extends StatefulWidget {
  String description="";
  String nameTask="";
  TodoItem({super.key,required this.description,required this.nameTask});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Card(
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20))),
        color: Colors.white,
        elevation: 10,
        child: Slidable(

          endActionPane:  ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                autoClose: true,
                flex: 1,
                onPressed: (_){},
                backgroundColor: const Color(0xFF147AEE),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edite',
              ),
              SlidableAction(
                autoClose: true,
                onPressed: (_){},
                backgroundColor: const Color(0xe8e70606),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Container(
            height: 90,
            child: Row(
              children: [
                Text(widget.description)
              ],
            ),
          ),
        ),
      ),
    );
  }
}