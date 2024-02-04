import 'dart:convert';

import 'package:crm/model/client.dart';
import 'package:crm/screen/client-list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClientService {
  Uri uri;
  ClientService()
      : uri = Uri.https("65b8e844b71048505a89bba7.mockapi.io", "/clients");

// get all clients
  Future<List<Client>> fetchData({String? zoneId}) async {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<Client> clients = jsonData
          .map((item) => Client.fromMap(item))
          .where((client) => client.zoneID == zoneId)
          .toList();
      print(clients.toString());
      return clients;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // get client by id
  Future<Client> getClientById(String clientId) async {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<Client> clients =
          jsonData.map((item) => Client.fromMap(item)).toList();
      return clients.firstWhere((element) => element.id == clientId);
    } else {
      throw Exception('Failed to load data');
    } 
  }

  // add a new client
  Future<void> addClient(
    Client client,
    BuildContext context,
    String zone,
    String id,
    String code,
  ) async {
    final response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(client.toMap()));

    if (response.statusCode == 201) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ClientList(
            id: id,
            zone: zone,
            districtId: code,
          ),
        ),
      );
    } else {
      throw Exception('Failed to add client');
    }
  }

  // update the client
  Future<void> updateClient(
    Client client,
    BuildContext context,
    String zone,
    String id,
    String code,
  ) async {
    final updateUri = Uri.https(
        "65b8e844b71048505a89bba7.mockapi.io", "/clients/${client.id}");

    final response = await http.put(updateUri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(client.toMap()));

    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ClientList(
            id: id,
            zone: zone,
            districtId: code,
          ),
        ),
      );
    } else {
      throw Exception('Failed to update client');
    }
  }

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
