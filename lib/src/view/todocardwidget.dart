import 'package:flutter/material.dart';
import 'package:todoappflutter/src/model/todomodel.dart';

class CardTodo extends StatelessWidget {
  final TodoModel todo;
  final Function removecard;
  final Widget checkbox;

  const CardTodo(
      {required this.todo,
      required this.removecard,
      required this.checkbox,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 55,
            color: Colors.green,
            child: ListTile(
              leading: checkbox,
              title: Text(todo.description, style: TextStyle(color: Colors.white)),
              trailing: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  color: Colors.red,
                  height: 40,
                  width: 40,
                  child: IconButton(
                      onPressed: () {
                        removecard(todo.id);
                      },
                      icon: Icon(Icons.delete, color: Colors.white,)),
                ),
              ),
            )),
      ),
    );
  }
}