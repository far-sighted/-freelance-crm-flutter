import 'dart:convert';

import 'package:crm/model/client.dart';
import 'package:flutter/material.dart';
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
      return clients;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // get client by id

  // add a new client
  Future<void> addClient(
    Client client,
    BuildContext context,
  ) async {
    final response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(client.toMap()));

    if (response.statusCode == 201) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      print("Client added successfully");
    } else {
      throw Exception('Failed to add client');
    }
  }

  // update the client

  // delete the client
  Future<void> deleteClient(String clientId) async {
    final deleteUri =
        Uri.https("65b8e844b71048505a89bba7.mockapi.io", "/clients/$clientId");

    final response = await http.delete(deleteUri);

    if (response.statusCode == 200) {
      print("Client deleted successfully");
    } else {
      throw Exception('Failed to delete client');
    }
  }
}
