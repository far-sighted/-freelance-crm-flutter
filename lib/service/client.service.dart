import 'dart:convert';

import 'package:crm/model/client.dart';
import 'package:http/http.dart' as http;

class ClientService {
  Uri uri;
  ClientService()
      : uri = Uri.https("65b8e844b71048505a89bba7.mockapi.io", "/clients");

// get all clients
  Future<List<Client>> fetchData() async {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<Client> clients =
          jsonData.map((item) => Client.fromMap(item)).toList();
      print("clients ${clients.toString()}");
      return clients;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // get client by id
  // add a new client
  // delete the client
  // update the client
}
