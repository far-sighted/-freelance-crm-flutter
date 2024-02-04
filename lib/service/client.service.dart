import 'dart:convert';

import 'package:crm/model/client.dart';
import 'package:http/http.dart' as http;

class ClientService {
  Uri uri;
  ClientService()
      : uri = Uri.https(
            "069718fd-da44-4e6b-9797-73c923894358.mock.pstmn.io", "/clients");

// get all clients
  Future<List<Client>> fetchData() async {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<Client> clients =
          jsonData.map((item) => Client.fromMap(item)).toList();
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
