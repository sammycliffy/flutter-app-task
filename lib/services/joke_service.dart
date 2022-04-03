import '../models/jokes_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JokeServices {
  Future<RandomJokeModel> fetchRandomJoke() async {
    final response = await http.get(
      Uri.parse(
        'https://joke.api.gkamelo.xyz/random',
      ),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "X-API-Key": 'QUtFhHPnlQ5f13LDVpQL3a54XgQzTlCJa1PMSB3o'
      },
    );
    if (response.statusCode == 200) {
      return RandomJokeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to get Joke");
    }
  }
}
