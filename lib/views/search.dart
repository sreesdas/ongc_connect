import 'package:flutter/material.dart';
import 'package:sqlfite_starter/providers/database_provider.dart';

import 'package:sqlfite_starter/models/todo.dart';
import 'package:sqlfite_starter/views/result.dart';

class TodoSearch extends SearchDelegate<String>{

  String selected;

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation,), 
      onPressed: (){
        close(context, null);
      },
    );
  
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<Todo>(
      future: DatabaseProvider.db.find(selected) ,
      builder: (BuildContext context, AsyncSnapshot<Todo> snapshot){
        if( snapshot.hasData ) {
          
          return ResultPage(todo: snapshot.data);
        
        } else {
          return ListTile(
            leading: Icon(Icons.cloud_off),
            title: Text("No suggestions found"),
          );
        }
      }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return FutureBuilder<Todos>(
      future: DatabaseProvider.db.search(query) ,
      builder: (BuildContext context, AsyncSnapshot<Todos> snapshot){
        if( snapshot.hasData ) {
          return ListView.builder(
            itemCount: snapshot.data.todos.length,
            itemBuilder: ( BuildContext ctx, int idx ) {
                Todo item = snapshot.data.todos[idx];
                return ListTile(
                  title: Text(item.title),
                  leading: query.isEmpty ? Icon(Icons.refresh) : Icon(Icons.search),
                  onTap: () {
                    query = item.title;
                    selected = item.title;
                    showResults(context);
                  },
                );
            }
          );
        } else {
          return ListTile(
            leading: Icon(Icons.cloud_off),
            title: Text("No suggestions found"),
          );
        }
      }
    );
    
  }

}