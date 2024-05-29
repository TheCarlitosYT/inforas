import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inforas/helpers/debouncer.dart';

class InforasProvider {
  static final _baseUrl = '10.0.2.2:8089';
  static String apiKey = '';

  final debouncer = Debouncer(duration: Duration(milliseconds: 500));

  static Future<List<dynamic>> getJsonData(String endpoint) async {
    final url = Uri.http(_baseUrl, endpoint);

    Map<String, String> headers = {
      'Authorization': apiKey,
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 500) {}
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Solicitud estado GET: OK');
      return json.decode(response.body);
    } else {
      throw Exception('Error en la solicitud HTTP GET: ${response.statusCode}');
    }
  }

  static Future<String> postJsonData(
      String enpoint, Map<String, dynamic> data) async {
    final url = Uri.http(_baseUrl, enpoint);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': apiKey,
    };

    String body = json.encode(data);

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Solicitud estado POST: OK');
      print(response.body);
      return response.body;
    } else {
      print(response.body);
      throw Exception(
          'Error en la solicitud HTTP POST: ${response.statusCode}');
    }
  }

  static Future<String> putJsonData(
      String endpoint, Map<String, dynamic> data) async {
    final url = Uri.http(_baseUrl, endpoint);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': apiKey,
    };

    String body = json.encode(data);

    final response = await http.put(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Solicitud estado PUT: OK');
      print(response.body);
      return response.body;
    } else {
      throw Exception('Error en la solicitud HTTP PUT: ${response.statusCode}');
    }
  }

  static Future<String> deleteData(String endpoint) async {
    final url = Uri.http(_baseUrl, endpoint);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': apiKey,
    };
    final response = await http.delete(url, headers: headers);
    print('responseee ${response.body}');

    if (response.statusCode == 200) {
      print('Solicitud estado DELETE: OK');
      print(response.body);
      return response.body;
    } else {
      throw Exception(
          'Error en la solicitud HTTP DELETE: ${response.statusCode}');
    }
  }
}