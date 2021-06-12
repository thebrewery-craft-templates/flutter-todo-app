import 'dart:convert';

import 'package:todo_app/constants.dart';
import 'package:todo_app/model/todo.dart';
import 'package:http/http.dart';

class TodoUtils {

  static final String _baseUrl = kParseAPIUrl + "/classes/";

  //CREATE
  static Future<Response> addTodo(Todo todo) async {
    String apiUrl = _baseUrl + "Todo";

    Response response = await post(
      Uri.parse(apiUrl),
      headers: {
        'X-Parse-Application-Id': kParseApplicationId,
        'X-Parse-REST-API-Key': kParseRestApiKey,
        'Content-Type': 'application/json'
      },
      body: json.encode(todo.toJson()),
    );

    return response;
  }

  //READ
  static Future getTodoList() async {
    String apiUrl = _baseUrl + "Todo";

    Response response = await get(Uri.parse(apiUrl), headers: {
      'X-Parse-Application-Id': kParseApplicationId,
      'X-Parse-REST-API-Key': kParseRestApiKey,
    });

    return response;
  }

  //UPDATE
  static Future updateTodo(Todo todo) async {
    String apiUrl = _baseUrl + "Todo/${todo.objectId}";

    Response response = await put(Uri.parse(apiUrl),
        headers: {
          'X-Parse-Application-Id': kParseApplicationId,
          'X-Parse-REST-API-Key': kParseRestApiKey,
          'Content-Type': 'application/json',
        },
        body: json.encode(todo.toJson()));

    return response;
  }

  //DELETE
  static Future deleteTodo(String objectId) async {
    String apiUrl = _baseUrl + "Todo/$objectId";

    Response response = await delete(Uri.parse(apiUrl), headers: {
      'X-Parse-Application-Id': kParseApplicationId,
      'X-Parse-REST-API-Key': kParseRestApiKey,
    });

    return response;
  }
}
