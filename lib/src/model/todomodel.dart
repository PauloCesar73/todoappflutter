import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String id;
  String description;
  bool check;

  TodoModel({required this.description, required this.id, required this.check});

  factory TodoModel.fromDocument(DocumentSnapshot doc) {

    //Converção do documento do Firestore em um objeto Tarefa, que então é exibido na lista de tarefas.
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return TodoModel(
      id: doc.id,
      description: data['description'],
      check: data['check'] ?? false,
    );
  }
  // TodoModel.fromFirestore(Map<String, dynamic> map) {
  //   id = map["id"] ?? "";
  //   description = map["description"] ?? "";
  //   check = map["check"] = false;
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     "id": id,
  //     "description": description,
  //     "check": check,
  //   };
  // }
}