import 'dart:convert';

import 'package:http/http.dart' as http;

class ClientService {
  Uri uri;
  ClientService() : uri = Uri.https("", "");

// get all clients
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // get client by id
  // add a new client
  // delete the client
  // update the client

}
