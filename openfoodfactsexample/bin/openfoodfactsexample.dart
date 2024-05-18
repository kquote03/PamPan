import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  print(await http.read(Uri.parse(
      "https://world.openfoodfacts.org/api/v0/product/8690504019091.json")));
}
