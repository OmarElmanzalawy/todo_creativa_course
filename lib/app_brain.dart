import 'package:flutter/cupertino.dart';
import 'package:todo_starter/models/task_model.dart';

class AppBrain {

  ValueNotifier<List<TaskModel>> tasks = ValueNotifier([]);

  void addTask(TaskModel task){
    tasks.value = [...tasks.value, task];
  }

  void deleteTask(int index){
    //copy 
    final List<TaskModel> newList = List.from(tasks.value);
    //remove at certain index
    newList.removeAt(index);
    //update notifier
    tasks.value = newList;
  }

  void completeTask(int index){
    //copy 
    List<TaskModel> newList = List.from(tasks.value);
    //Modify isCompleted
    newList[index].isCompleted = !newList[index].isCompleted;
    //Update notifier
    tasks.value = newList;
  }



}