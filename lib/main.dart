import 'package:flutter/material.dart';
import 'package:sqlfite_starter/providers/api_provider.dart';
import 'package:sqlfite_starter/providers/database_provider.dart';
import 'package:sqlfite_starter/views/detail.dart';
import 'package:sqlfite_starter/views/login.dart';
import 'package:sqlfite_starter/views/search.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OAGT Connect',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(title: 'OAGT Connect'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    bootstrap();
    super.initState();
  }

  bootstrap() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int loggedIn = prefs.getInt('loggedIn');
    
    if(loggedIn == null) print('not set');
    else print('set');

    // await ApiProvider().getData();
    // setState(() {});
  }

  login() async{

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setInt('loggedIn', 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<Todos>(
        future: DatabaseProvider.db.read(),
        builder: ( BuildContext context, AsyncSnapshot<Todos> snapshot) {
          if( snapshot.hasData ) {
            return ListView.builder(
              itemCount: snapshot.data.todos.length,
              itemBuilder: ( BuildContext ctx, int idx ) {
                Todo item = snapshot.data.todos[idx];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.subtitle),
                  leading: 
                  // Hero(
                  //   tag: item.title,
                  //   child: 
                    CircleAvatar(
                      // backgroundColor: Colors.blueAccent,
                      child: Text(item.title[0].toUpperCase(), style: TextStyle( fontSize: 18.0 )),
                    ),
                  // ),
                  onTap: () {
                     Navigator.push( context, MaterialPageRoute(builder: (context) => DetailPage(todo: item)), );
                  },
                );
              },
            );
          }
          return Center(
            // child: Icon(Icons.done_all, color: Colors.green, size: 60.0,),
            child: CircularProgressIndicator()
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search), 
        onPressed: () {
          showSearch(context: context, delegate: TodoSearch());
        },
        backgroundColor: Colors.orange,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(padding: EdgeInsets.symmetric(horizontal: 25.0),icon: Icon(Icons.menu), onPressed: login() ),
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 20.0), 
              icon: Icon(Icons.account_circle), 
              onPressed: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }
}

