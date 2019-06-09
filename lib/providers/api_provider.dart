import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sqlfite_starter/models/todo.dart';
import 'package:sqlfite_starter/providers/database_provider.dart';


class ApiProvider {

  getData() async{
    // var response = await http.get('https://thecomputerphile.in/json.php');
    var response = await http.get('https://apis.oagtapp.xyz/');
    var jsonArray = json.decode(response.body);
    await DatabaseProvider.db.batch(Todos.fromJson(jsonArray));
  }

  getUpdatedData() async{
    // var response = await http.get('https://thecomputerphile.in/json.php');
    var response = await http.get('https://apis.oagtapp.xyz/');
    var jsonArray = json.decode(response.body);
    await DatabaseProvider.db.batch(Todos.fromJson(jsonArray));
  }

}