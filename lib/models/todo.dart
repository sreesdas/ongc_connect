class Todos {
  List<Todo> todos;

  Todos({this.todos});

  // for tranforming data received from api calls
  Todos.fromJson(List<dynamic> json) {
    if (json != null) {
      todos = new List<Todo>();
      json.forEach((v) {
        todos.add(new Todo.fromJson(v));
      });
    }
  }

  // for tranforming data received from db calls
  Todos.fromMap(List<Map<String, dynamic>> map) {
    if (map != null) {
      todos = new List<Todo>();
      map.forEach((v) {
        todos.add(new Todo.fromMap(v));
      });
    }
  }

}

class Todo {
  String title;
  String subtitle;

  Todo({this.title, this.subtitle});

  Todo.fromJson(dynamic json) {
    title = json['title'];
    subtitle = json['subtitle'];
  }

  Todo.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    subtitle = map['subtitle']; 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    return data;
  }
}