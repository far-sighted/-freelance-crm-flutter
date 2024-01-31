import 'package:flutter/material.dart';
import 'package:crm/screen/client-form.dart';
import 'package:crm/component/client-floating-add-button.dart';

class ClientList extends StatefulWidget {
  final String id;
  final String zone;

  const ClientList({super.key, required this.id, required this.zone});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.zone} Clients'),
      ),
      floatingActionButton: const FloatingButton(path: ClientForm()),
    );
  }
}
