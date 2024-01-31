import 'dart:convert';

class Client {
  Client();

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client();
  }

  factory Client.fromJson(String source) =>
      Client.fromMap(json.decode(source) as Map<String, dynamic>);
}
