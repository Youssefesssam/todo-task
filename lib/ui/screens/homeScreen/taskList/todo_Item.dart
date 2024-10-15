import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/firebase/firebase.dart';
import 'package:todo_task/provider/provider.dart';
import 'package:todo_task/ui/utilites/theme/mytheme.dart';

import '../../../../taskModel.dart';
import '../edite/edite.dart';

class TodoItem extends StatefulWidget {
  TaskModel taskModel;

  TodoItem({super.key, required this.taskModel});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    ListProvider listProvider = Provider.of<ListProvider>(context);
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20))),
        elevation: 20,
        child: Slidable(
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                autoClose: true,
                onPressed: (_){
                  if (widget.taskModel != null) {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      isScrollControlled: true,
                      context: context,
                        builder: (context)=>Padding(
                          padding:MediaQuery.of(context).viewInsets ,
                          child:  Edite(taskModel: widget.taskModel),
                        ));
                  } else {

                    print("TaskModel is null");
                  }
                },
                backgroundColor: MyTheme.PrimaryColor,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edite',
              ),
              SlidableAction(
                autoClose: true,
                onPressed: (_) {
                  FirebaseFunctions.delete(widget.taskModel);
                  listProvider.getAllTasksFromFireStore();
                },
                backgroundColor: const Color(0xf4cc2626),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Container(
           padding: const EdgeInsets.only(left: 20),
           height: MediaQuery.of(context).size.height * .13,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.only(
               bottomLeft: Radius.circular(20),
               topLeft: Radius.circular(20),
             ),
             color: widget.taskModel.isDone! ? Colors.white : Color(0x3AD5E7D7),
           ),
           child: Row(
             children: [
               Container(
                 margin: const EdgeInsets.all(10),
                 width: 4,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(40),
                   color: widget.taskModel.isDone!
                       ? MyTheme.green
                       : MyTheme.PrimaryColor,
                 ),
               ),
               Container(
                 margin: const EdgeInsets.all(10),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                         widget.taskModel.title ?? "",
                         style: Theme.of(context)
                             .textTheme
                             .titleLarge
                             ?.copyWith(
                                 color: widget.taskModel.isDone!
                                     ? MyTheme.green
                                     : MyTheme.PrimaryColor,
                                 fontSize: 25)),
                     const SizedBox(height: 6),
                     Row(
                       children: [
                         Text(
                           widget.taskModel.description ?? "",
                           style: Theme.of(context)
                               .textTheme
                               .titleLarge
                               ?.copyWith(
                                   color: MyTheme.black,
                                   fontSize: 22,
                                   fontWeight: FontWeight.w400),
                         ),
                         const SizedBox(width: 5),

                       ],
                     ),
                     const SizedBox(height: 6),
                     Column(
                       children: [

                         Text(
                           '${widget.taskModel.date?.day}/${widget.taskModel.date?.month}/${widget.taskModel.date?.year}' ??
                               "",
                           style: Theme.of(context)
                               .textTheme
                               .titleLarge
                               ?.copyWith(
                                   color: MyTheme.black,
                                   fontSize: 12,
                                   fontWeight: FontWeight.w400),
                         ),
                       ],
                     )
                   ],
                 ),
               ),
               const Spacer(),
               InkWell(

                 onTap: () {
                   widget.taskModel.isDone = !widget.taskModel.isDone!;
                   setState(() {});
                   FirebaseFunctions.updateTask(widget.taskModel);

                 },
                 child: Container(
                     margin: EdgeInsets.all(20),
                     child:widget.taskModel.isDone== true ? Text("Done..!",style: TextStyle(color: MyTheme.green,fontSize: 35,fontWeight: FontWeight.bold),):
                     Icon(
                       Icons.check_circle_rounded,
                       color: MyTheme.PrimaryColor,
                       size: 55,
                     )
                 ),
               )
             ],
           ),
              ),
        ),
      ),
    );
  }
}
