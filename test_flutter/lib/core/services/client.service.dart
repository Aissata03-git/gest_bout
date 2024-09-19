import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_flutter/core/models/client.models.dart';
import 'package:test_flutter/core/services/api.url.dart';

class ClientService {
  final String apiUrl = "http://localhost:8894/api/v1";
  
  get baseUrl => null; 

  // Récupérer tous les clients
  Future<List<Client>> getClients() async {
    final response = await http.get(Uri.parse('apiUrl'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((client) => Client.fromJson(client)).toList();
    } else {
      throw Exception('Failed to load clients');
    }
  }

  // Ajouter un nouveau client
  Future<Client> addClient(Client client) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(client.toJson()),
    );

    if (response.statusCode == 201) {
      return Client.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add client');
    }
  }

  // Supprimer un client
  Future<void> deleteClient(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete client');
    }
  }

  // Modifier un client
  Future<Client> updateClient(int id, Client client) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(client.toJson()),
    );

    if (response.statusCode == 200) {
      return Client.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update client');
    }
  }
}
