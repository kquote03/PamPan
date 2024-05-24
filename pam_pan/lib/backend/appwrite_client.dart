
import 'package:appwrite/appwrite.dart';

Client client = Client()
    .setEndpoint('http://localhost/v1')
    .setProject('665039250035c9a58fe1')
    .setSelfSigned(status: true); // For self signed certificates, only use for development
Account account = Account(client);