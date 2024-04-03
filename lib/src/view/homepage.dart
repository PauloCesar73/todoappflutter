import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoappflutter/src/model/todomodel.dart';
import 'package:todoappflutter/src/view/todocardwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _descr = TextEditingController();
  List<TodoModel> todolist = [];
  final CollectionReference datb =
      FirebaseFirestore.instance.collection('tarefas');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            _dialogBuilder(context);
          },
          child: const Icon(Icons.add)),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Lista de Tarefas"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: datb.snapshots(),
                builder: (context, snapshott) {
                  if (!snapshott.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                  todolist = [];
                  for (var element in snapshott.data!.docs) {
                    todolist.add(TodoModel.fromDocument(element));
                  }
                  return ListView.builder(
                      itemCount: todolist.length,
                      itemBuilder: (context, index) {
                        TodoModel todoo = todolist[index];
                        return CardTodo(
                            todo: todoo,
                            checkbox: Checkbox(
                              value: todoo.check,
                              onChanged: (value) {
                                check(todoo, value ?? false, todoo.id);
                              },
                            ),
                            removecard: remove);
                      });
                }
                // ListView(children: [

                // ]),
                ),
          )
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TextField(
            controller: _descr,
            decoration: InputDecoration(hintText: "Nova Tarefa"),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Adicionar'),
              onPressed: () {
                add(_descr.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  add(String des) {
    setState(() {
      todolist.add(TodoModel(
          check: false,
          description: des,
          id: DateTime.now().millisecondsSinceEpoch.toString()));
      if (des.isNotEmpty) {
        datb.add({'description': des, 'check': false});
        _descr.clear();
      }
    });
  }

  remove(String id) {
    setState(() {
      todolist.removeWhere((element) => element.id == id);
      datb.doc(id).delete();
    });
  }

  check(TodoModel todoo, bool check, String id) {
    setState(() {
      todoo.check = !todoo.check;
      datb.doc(id).update({'check': check});
    });
  }
}
