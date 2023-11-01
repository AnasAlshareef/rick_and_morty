import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/data/models/results.dart';

class WebServices {


  Future<List<Results>> fetchAllCharacters() async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['results'];
      return jsonData.map((userJson) => Results.fromJson(userJson)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

}
