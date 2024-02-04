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
    _clientsFuture = ClientService().fetchData(zoneId: widget.id);
    print("ClientList: ${widget.id}, ${widget.zone}, ${widget.districtId}");
  }

  Future<void> _refresh() async {
    // Fetch data again when the user pulls to refresh
    setState(() {
      _clientsFuture = ClientService().fetchData(zoneId: widget.id);
    });
  }

  @override
  void didUpdateWidget(covariant ClientList oldWidget) {
    if (oldWidget.id != widget.id ||
        oldWidget.zone != widget.zone ||
        oldWidget.districtId != widget.districtId) {
      // Widget parameters have changed, update the filter
      _refresh();
    }
    super.didUpdateWidget(oldWidget);
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
          zone: widget.zone,
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
                            zone: widget.zone,
                            code: widget.districtId,
                            client: clients[index],
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
                            ClientService()
                                .deleteClient(clients[index].id!)
                                .then((_) {
                              setState(() {
                                clients.removeAt(index);
                              });
                            });
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
