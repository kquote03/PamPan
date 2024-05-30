import 'dart:collection';

import 'package:appwrite/appwrite.dart';
import 'package:intl/intl.dart';

Client client = Client()
    .setEndpoint('http://100.125.122.55/v1')
    .setProject('665039250035c9a58fe1')
    .setSelfSigned(
        status: true); // For self signed certificates, only use for development
Account account = Account(client);
final databases = Databases(client);

Future<List<Map<String, dynamic>>> getItems() async {
  var documents = await databases.listDocuments(
      databaseId: '6650884f00137e1b1fcd',
      collectionId: '6650886f0027a739c072',
      queries: [
        Query.select([
          "name",
          "quantity",
          "expiryDate",
          "measurementUnit",
          "categories.*",
          "\$id"
        ])
      ]);
  List<Map<String, dynamic>> items = [];

  for (var i in documents.documents) {
    items.add({
      '\$id': i.data['\$id'],
      'name': i.data['name'],
      'quantity': i.data['quantity'].toString(),
      'expiryDate':
          DateFormat('yyyy-MM-dd').format(DateTime.parse(i.data['expiryDate'])),
      'measurementUnit': i.data['measurementUnit'],
      'categories': i.data['categories']['name']
    });
    print(items);
  }
  return items;
}

Future<List<Map<String, dynamic>>> getItemsById(id) async {
  var documents = await databases.listDocuments(
      databaseId: '6650884f00137e1b1fcd',
      collectionId: '6650886f0027a739c072',
      queries: [Query.equal('\$id', id)]);
  List<Map<String, dynamic>> items = [];

  for (var i in documents.documents) {
    items.add({
      '\$id': i.data['\$id'],
      'name': i.data['name'],
      'quantity': i.data['quantity'].toString(),
      'expiryDate':
          DateFormat('yyyy-MM-dd').format(DateTime.parse(i.data['expiryDate'])),
      'measurementUnit': i.data['measurementUnit'],
      'categories': i.data['categories']['name']
    });
    print(items);
  }
  return items;
}

Future<List<String>> getCategories() async {
  var documents = await databases.listDocuments(
      databaseId: '6650884f00137e1b1fcd',
      collectionId: '665089ef003013ad1543',
      queries: [
        Query.select(["name"])
      ]);

  List<String> categoryList = [];
  for (var i in documents.documents) {
    categoryList.add(i.data['name']);
  }
  return categoryList;
}

void deleteItemById(id) async {
  databases.deleteDocument(
      databaseId: '6650884f00137e1b1fcd',
      collectionId: '6650886f0027a739c072',
      documentId: id);
}
