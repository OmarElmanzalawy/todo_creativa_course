import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_starter/models/task_model.dart';

class AppBrain {

  ValueNotifier<List<TaskModel>> tasks = ValueNotifier([]);

  void addTask(TaskModel task)async{
    try{
      //add task to tasks collection
      final uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection("users").doc(uid).collection("tasks").doc(task.id).set({
        "id": task.id,
        "title": task.title,
        "description": task.description,
        "isCompleted": task.isCompleted
      });
      tasks.value = [...tasks.value, task];
    }catch(e){
      print("Error while adding task to firestore");
      print("ERROR: ${e.toString()}");
    }
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