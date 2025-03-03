import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
   Loginscreen({super.key});
  
  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final emailController= TextEditingController();
  final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: Text("Login screen"),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 100,),
            TextField(
             controller:emailController,
             decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder()
             ), 
            ),
            SizedBox(height: 10,),
            TextField(
             // controller:passwordController,
             decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder()
             ), 
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){}, child:Text("Login")),
          ],
        ),

      ),
    );
  }
}