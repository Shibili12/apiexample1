import 'package:apiexample1/models/photos.dart';

import 'package:http/http.dart' as http;

class Photoservice {
  Future<List<Photos>?> getphoto() async {
    var clientphoto = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var response = await clientphoto.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      photosFromJson(json);
    }
  }
}
