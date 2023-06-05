import 'dart:convert';
import 'dart:developer';

import 'package:appcours/models/meme.dart';
import 'package:http/http.dart' as http;

class MemeService {
  /*
    Future: équivalent des promesses JS
  */
  Future getMemes() async {
    // url de l'api
    Uri url = Uri.parse('https://api.imgflip.com/get_memes');

    // récupération de la réponse HTPP en GET
    http.Response response = await http.get(url);

    // inspect(response);

    // récupérer les données
    if (response.statusCode == 200) {
      // deécoder les données
      List data = jsonDecode(response.body)['data']['memes'];
      // retourner une liste d'objet meme
      return data
          .map((value) => Meme(name: value['name'], url: value['url']))
          .toList();
    } else {
      throw Error();
    }
  }
}
