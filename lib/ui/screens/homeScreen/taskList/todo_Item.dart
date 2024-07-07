import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_task/ui/utilites/theme/mytheme.dart';

import '../../../../taskModel.dart';

class TodoItem extends StatelessWidget {
  TaskModel taskModel;
  TodoItem({super.key,required this.taskModel});

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
            padding: const EdgeInsets.only(left: 20),
            height: MediaQuery.of(context).size.height*.13,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all( 10),
                  width: 4 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: MyTheme.PrimaryColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(taskModel.title??"",style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: MyTheme.PrimaryColor,fontSize: 25)
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(taskModel.description??"",style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: MyTheme.black,fontSize: 22,fontWeight: FontWeight.w400) ,
                          ),
                          const SizedBox(width: 5),

                        Icon(Icons.access_time_sharp,size: 20,)
                        ],
                      ),
                      const SizedBox(height: 6),

                      Text('${taskModel.date?.day}/${taskModel.date?.month}/${taskModel.date?.year}'??"",style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: MyTheme.black,fontSize: 12,fontWeight: FontWeight.w400) ,
                    ),
                    ],

                  ),

                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                    child:const Icon(Icons.check_circle_rounded,color: MyTheme.PrimaryColor,size: 55,)

                )
              ],
            ),

          ),
        ),
      ),
    );
  }
}