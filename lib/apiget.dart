import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ApiExampleScreen(),
    );
  }
}

class ApiExampleScreen extends StatefulWidget {
  @override
  _ApiExampleScreenState createState() => _ApiExampleScreenState();
}

class _ApiExampleScreenState extends State<ApiExampleScreen> {
  List<dynamic> users = []; 

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    Dio dio = Dio();
    String apiUrl = 'https://jsonplaceholder.typicode.com/users'; 

    try {
      Response response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        setState(() {
          users = response.data; 
    
        });
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple User API Example')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  var user = users[index]; 
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(user['name']),
                      subtitle: Text('${user['email']} | ${user['phone']}'),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Text(user['name'][0],
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
