import 'package:crm/model/client.dart';
import 'package:crm/service/client.service.dart';
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
  late Future<List<Client>> _clientsFuture;

  @override
  void initState() {
    super.initState();
    _clientsFuture = ClientService().fetchData();
  }

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
        body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: FutureBuilder<List<Client>>(
            future: _clientsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<Client> client = snapshot.data ?? [];
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 4.0,
                    childAspectRatio: 5 / 1,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: client.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ClientForm(
                                    id: widget.id,
                                    code: widget.districtId,
                                  )),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                              '${client[index].firstName} ${client[index].lastName}'),
                          subtitle: Text(
                              "${client[index].house}, ${client[index].street}, ${client[index].city}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // delete the client
                            },
                          ),
                        ),
                      )),
                );
              }
            },
          ),
        ));
  }
}
