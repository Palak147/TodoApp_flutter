import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import './models/todo.dart';
import './widgets/todoItem.dart';
import './widgets/errorScreen.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatefulWidget {
  @override
  _ToDoAppState createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  List<ToDo> toDoList;
  bool isError = false;

//**************May be used for activity indicator ***************************//

  // Future<List<ToDo>> fetchPost() async {
  //   final response = await get('https://jsonplaceholder.typicode.com/todos');

  //   if (response.statusCode == 200) {
  //     // If the call to the server was successful, parse the JSON
  //     return List<ToDo>.from(json
  //         .decode(response.body)
  //         .map((toDoItem) => ToDo.fromJson(toDoItem)));
  //     // print("Status OK");
  //   } else {
  //     // If that call was not successful, throw an error.
  //     return null;
  //   }
  // }

  void _fetchToDos() async {
    try {
      var response = await get('https://jsonplaceholder.typicode.com/todos');
      if (response.statusCode == 200) {
        setState(() {
          this.toDoList = List<ToDo>.from(
              json.decode(response.body).map((x) => ToDo.fromJson(x)));
          isError = false;
        });
      }
    } catch (ex) {
      setState(() {
        isError = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    print('initState Called');
    _fetchToDos();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: Text(
              'ToDo List',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: isError
            ? ErrorScreen(_fetchToDos)
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: ToDoItem(toDo: toDoList[index]),
                  );
                },
                itemCount: toDoList != null ? toDoList.length : 0,
              ),
      ),
    );
  }
}
