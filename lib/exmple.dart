import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApigetScreen extends StatefulWidget {
  const ApigetScreen({super.key});
   
  @override
  State<ApigetScreen> createState() => _ApigetScreenState();
}

class _ApigetScreenState extends State<ApigetScreen> {
  List users=[];
  String api="";
  Dio dio=Dio();
  @override
  fetchusers() async{
    Response response= await dio.get(api);
    try{
      if(response.statusCode==200)
      {
        setState(() {
          users.response.data;
        });
      }
    }catch (e) {

    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blueGrey,
        title: Text("user Api screen",style: TextStyle(color: const Color.fromARGB(26, 236, 223, 223)),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
             Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context,index)
                {
                 var User= users[index];
                 return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                   leading:CircleAvatar(
                    child: Text(users['name']),
                   ), 
                   title: Text(users['usernsme']),
                  ),

                 );
              
                }
                
                ),
            ),
          ],
        ),
      ),
    );
  }
}