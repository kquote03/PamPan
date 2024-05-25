
import 'package:appwrite/appwrite.dart';

Client client = Client()
    .setEndpoint('http://100.125.122.55/v1')
    .setProject('665039250035c9a58fe1')
    .setSelfSigned(status: true); // For self signed certificates, only use for development
Account account = Account(client);