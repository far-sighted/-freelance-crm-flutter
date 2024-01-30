import 'package:flutter/material.dart';
import 'package:crm/screen/client-form.dart';
import 'package:crm/component/client-floating-add-button.dart';

class ClientList extends StatefulWidget {
  const ClientList({super.key});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client List'),
      ),
      floatingActionButton: const FloatingButton(path: ClientForm()),
    );
  }
}
