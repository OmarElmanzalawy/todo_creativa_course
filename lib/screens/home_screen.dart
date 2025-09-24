import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_starter/main.dart';
import 'package:todo_starter/models/task_model.dart';
import 'package:todo_starter/screens/signup_screen.dart';
import 'package:todo_starter/widgets/custom_textfield.dart';
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
    print("trigger rebuild");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            context: context,
            builder:(context) {
              final _nameController = TextEditingController();
              final _subtitleController = TextEditingController();

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextfield(
                      controller: _nameController,
                       hintText: "Task title",
                        prefixIcon: Icons.task_alt,
                        ),
                        const SizedBox(height: 10,),
                    CustomTextfield(
                      controller: _subtitleController,
                       hintText: "Task description",
                        prefixIcon: Icons.task_alt,
                        ),
                        const SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){
                          final taskId = UniqueKey().toString();
                          print(taskId);

                          
                          final newTask = TaskModel(
                              id: taskId, 
                              title: _nameController.text,
                              description: _subtitleController.text,
                              isCompleted: false
                              );
                            
                          appBrain.addTask(newTask);
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
                          foregroundColor: WidgetStatePropertyAll(Colors.white)
                        ),
                         child: Text("Add task")
                        ),
                    )
                  ],
                ),
              );
            },
             );
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
          IconButton(onPressed: () async{
            await FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => SignupScreen(),), (route) => false);
          }, icon: Icon(Icons.logout,color: Colors.white,))
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: appBrain.tasks,
        builder:(context, value, child) {
          return Column(
          children: [ 
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: appBrain.tasks.value.length,
                itemBuilder: (context, index) {
                  return TaskItem(
                    model: appBrain.tasks.value[index],
                  );
                },
              )
            )
            
          ]
        );
        } 
      ),
    );
  }
}