import 'package:flutter/material.dart';
import 'package:crm/model/client.dart';
import 'package:crm/service/client.service.dart';
import 'package:crm/screen/client-form.dart';
import 'package:crm/component/client-floating-add-button.dart';

class ClientList extends StatefulWidget {
  final String id;
  final String zone;
  final String districtId;

  const ClientList({
    super.key,
    required this.id,
    required this.zone,
    required this.districtId,
  });

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  late Future<List<Client>> _clientsFuture;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _clientsFuture = ClientService().fetchData();
  }

  Future<void> _refresh() async {
    // Fetch data again when the user pulls to refresh
    setState(() {
      _clientsFuture = ClientService().fetchData();
    });
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
        ),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: FutureBuilder<List<Client>>(
            future: _clientsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot}'));
              } else {
                List<Client> clients = snapshot.data ?? [];
                print(clients);
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 4.0,
                    childAspectRatio: 5 / 1,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: clients.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ClientForm(
                            id: widget.id,
                            code: widget.districtId,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                            '${clients[index].firstName} ${clients[index].lastName}'),
                        subtitle: Text(
                            "${clients[index].house}, ${clients[index].street}, ${clients[index].city}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // Handle delete action
                          },
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
