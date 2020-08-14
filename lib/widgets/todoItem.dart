import 'package:flutter/material.dart';

import '../models/todo.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    Key key,
    @required this.toDo,
  }) : super(key: key);

  final ToDo toDo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: toDo.isCompleted
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            toDo.isCompleted ? Icons.done : Icons.block,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        title: Text(toDo.title),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text('id:${toDo.id} \t completed:${toDo.isCompleted}'),
        ),
      ),
    );
  }
}
