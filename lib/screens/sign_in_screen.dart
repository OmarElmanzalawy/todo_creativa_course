import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_starter/screens/signup_screen.dart';
import 'package:todo_starter/widgets/custom_textfield.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          // color: Colors.red,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40,),
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.deepPurple,
                  size: 95,
                  ),
                  const SizedBox(height: 8,),
                  Text("Sign In",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  Text("Sign in to get started with our app",style: TextStyle(color: Colors.black54),),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        CustomTextfield(
                          controller: _emailController,
                          hintText: "Email",
                          prefixIcon: Icons.person_outline,
                          validator: (p0) {
                            if(p0 == null){
                              return "Name can't be empty";
                            }
                            return p0.length <= 3 ? "Name can't be shorter than 3 characters " : null;
                          },
                          ),
                        const SizedBox(height: 12,),
                        CustomTextfield(
                          controller: _passwordController,
                          hintText: "Password",
                          prefixIcon: Icons.email_outlined,
                          validator: (p0) {
                            if(!p0!.contains("@gmail.com")){

                            }
                          },
                          ),
                          const SizedBox(height: 10,),
                          SizedBox(
                            width: 400,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: WidgetStatePropertyAll(0),
                                backgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
                                foregroundColor: WidgetStatePropertyAll(Colors.white),
                                padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
                              ),
                              onPressed: ()async{
                                final isValid = _formKey.currentState!.validate();
                                if(isValid){
                                  try{
                                    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text
                                  );
                                  }on FirebaseAuthException catch (e){
                                    print(e.code);

                                    if(e.code == "invalid-credential"){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Invalid credentials"))
                                      );
                                    }
                                  }
                                  catch(e){
                                    print(e.toString());
                                  }
                                }
                              },
                               child: Text("Sign In",style: TextStyle(fontWeight: FontWeight.bold),)
                               ),
                          )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()));
                      },
                       child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold),))
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}