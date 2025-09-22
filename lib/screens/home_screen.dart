import 'package:flutter/material.dart';
import 'package:todo_starter/main.dart';
import 'package:todo_starter/models/task_model.dart';
import 'package:todo_starter/widgets/task_item.dart';

//Global scope

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //HomeScreen scope
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            appBrain.tasks.add(
              TaskModel(id: "id1", title: "omar", description: "description", isCompleted: false)
            );
          });
        },
        shape: CircleBorder(),
        elevation: 1,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: Icon(Icons.add,size: 30,),
        ),
      appBar: AppBar(
        title: Text("Todo Screen",style: TextStyle(color: Colors.white),),

        backgroundColor: Colors.deepPurple,
        actions: [
          Icon(Icons.delete,color: Colors.white,),
        ],
      ),
      body: Column(
        children: [ 
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 20),
              itemCount: appBrain.tasks.length,
              itemBuilder: (context, index) {
                return TaskItem(
                  model: appBrain.tasks[index],
                );
              },
            )
          )
          
        ]
      ),
    );
  }
}