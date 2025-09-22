import 'package:flutter/material.dart';
import 'package:todo_starter/widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          
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
            child: ListView(
              padding: EdgeInsets.only(top: 20),
              children: [
               TaskItem(),
               TaskItem(),
              ],
            )
          )
          
        ]
      ),
    );
  }
}