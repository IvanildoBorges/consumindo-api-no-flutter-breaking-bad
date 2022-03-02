import 'dart:async';
import 'package:http/http.dart' as http;

class PersonagemAPI{
  static Future getPersonagens(){
    Uri url = Uri.parse('https://breakingbadapi.com/api/characters');
    return http.get(url);
  }
}