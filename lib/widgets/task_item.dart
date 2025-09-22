import 'package:flutter/material.dart';
import 'package:todo_starter/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.model});

  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
          ;
          },
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: widget.model.isCompleted ? Colors.deepPurple : null,
              // color: Colors.red
              border: Border.all(color: Colors.grey,width: 2)
            ),
            child:  Icon(Icons.check,color: Colors.white,),
          ),
          
        ),
        title: Text(model.title),
        subtitle: Text(model.description),
        trailing: IconButton(icon:  Icon(Icons.remove),onPressed: (){}
      ),
      ),
    );
  }
}