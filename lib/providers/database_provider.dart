import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlfite_starter/models/todo.dart';

class DatabaseProvider {
  
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  static Database _database;

  Future<Database> get database async {
    if ( _database == null ) 
      _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    
    var sql = '''CREATE TABLE todos(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title VARCHAR(100),
      subtitle TEXT
    )''';

    await db.execute(sql);
    print("todo table created!");
  }

  Future<Todo> find(String title) async {
    final db = await database;
    var response = await db.query("todos", where: "title = ?", whereArgs: [ title ] );
    return response.isNotEmpty ? Todo.fromJson(response.last) : null;
  }

  Future<Todos> read() async {
    final db = await database;
    var response = await db.query("todos", orderBy: 'title' );
    return response.isNotEmpty ? Todos.fromJson(response) : null;
  }

  Future<Todos> search(String keyword) async {
    final db = await database;
    var response;
    if(keyword.isEmpty){
      response = await db.query("todos", where: "title like ?", whereArgs: [ "%LITTY%" ]  );
    } else {
      response = await db.query("todos", where: "title like ?", whereArgs: [ "%" + keyword + "%" ]  );
    }
    
    return response.isNotEmpty ? Todos.fromJson(response) : null;
  }

  Future<int> batch(Todos todos) async {
    final db = await database;
    var batch = db.batch();
    todos.todos.forEach((todo) => {
      batch.insert("todos", todo.toJson())
    });
    await batch.commit(noResult: true);
    return 1;
  }

  Future<int> create(Todo todo) async {
    final db = await database;
    var response = await db.insert("todos", todo.toJson());
    return response;
  }

  Future<int> delete(Todo todo) async {
    final db = await database;
    var response = db.delete("todos", where: "title = ?", whereArgs: [ todo.title ] );
    return response;
  }


}