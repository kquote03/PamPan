import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:pam_pan/backend/appwrite_client.dart';

final databases = Databases(client);

List<List<String>> items = [[]];

class ExpiryTest {
  static List<List<String>> sortList(List<List<String>> list) {
    list.sort((a, b) => a[0].compareTo(b[0]));
    return list;
  }

  static DateTime stringToDate(String date) {
    return DateTime.parse(date);
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  void query() async {
    var documents = await databases.listDocuments(
        databaseId: '6650884f00137e1b1fcd',
        collectionId: '6650886f0027a739c072',
        queries: [
          Query.select(["name", "quantity"])
        ]);

    for (var i in documents.documents) {
      items.add([i.data['name'], i.data['quantity'].toString()]);
    }
  }
}
