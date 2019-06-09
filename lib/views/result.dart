import 'package:flutter/material.dart';
import 'package:sqlfite_starter/models/todo.dart';

class ResultPage extends StatelessWidget {
  final Todo todo;

  ResultPage({this.todo});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            // child: 
            // Hero(
            //   tag: todo.title,
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/loading.gif"),
                image: NetworkImage(
                  "https://picsum.photos/400/300",
                ),
              ),
            // )
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16.0, 180.0, 16.0, 16.0),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Card(
                      elevation: 3.0,
                      margin: EdgeInsets.only(top: 16.0),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    todo.title,
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Designation"),
                                    subtitle: Text("Location, Work Center"),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      IconButton( icon: Icon(Icons.call), onPressed: (){}, color: Colors.blue, ),
                                      Text("CALL")
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      IconButton(icon: Icon(Icons.message), onPressed: (){}, color: Colors.blue, ),
                                      Text("SMS")
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      IconButton(icon: Icon(Icons.mail), onPressed: (){}, color: Colors.blue,),
                                      Text("MAIL")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage("https://picsum.photos/400/300"),
                            fit: BoxFit.cover)),
                      margin: EdgeInsets.only(left: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Card(
                  elevation: 3.0,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("User information"),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Email"),
                        subtitle: Text("todo@ongc.co.in"),
                        leading: Icon(Icons.email),
                      ),
                      ListTile(
                        title: Text("Phone"),
                        subtitle: Text("+(91)-8259950403"),
                        leading: Icon(Icons.phone),
                      ),
                      ListTile(
                        title: Text("Website"),
                        subtitle: Text(todo.title),
                        leading: Icon(Icons.web),
                      ),
                      ListTile(
                        title: Text("About"),
                        subtitle: Text(todo.subtitle),
                        leading: Icon(Icons.person),
                      ),
                      ListTile(
                        title: Text("Birth Day"),
                        subtitle: Text("6 May"),
                        leading: Icon(Icons.calendar_view_day),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          AppBar(
            actions: <Widget>[
              IconButton(icon: Icon(Icons.edit), onPressed: (){}, padding: EdgeInsets.all(25.0),)
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false
          )
        ],
      ),
    );
  }
}

