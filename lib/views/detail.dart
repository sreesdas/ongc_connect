import 'package:flutter/material.dart';
import 'package:sqlfite_starter/models/todo.dart';
import 'package:sqlfite_starter/views/result.dart';

class DetailPage extends StatelessWidget {

  final Todo todo;

  DetailPage({ this.todo });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text( todo.title ) ),
      body: ResultPage(todo: todo),
    );
  }
}