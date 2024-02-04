import 'package:flutter/material.dart';
import 'package:crm/screen/client-form.dart';
import 'package:crm/component/client-floating-add-button.dart';

class ClientList extends StatefulWidget {
  final String id;
  final String zone;
  final String districtId;

  const ClientList(
      {super.key,
      required this.id,
      required this.zone,
      required this.districtId});

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
      floatingActionButton: FloatingButton(
          path: ClientForm(
        id: widget.id,
        code: widget.districtId,
      )),
    );
  }
}
