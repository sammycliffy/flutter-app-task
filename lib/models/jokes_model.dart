class RandomJokeModel {
  final int? id;
  final String? type;
  final String? jokeSetup;
  final String? jokePunchline;
  RandomJokeModel({this.id, this.type, this.jokeSetup, this.jokePunchline});
  factory RandomJokeModel.fromJson(Map<String, dynamic> json) {
    return RandomJokeModel(
        id: json['id'],
        type: json['type'],
        jokeSetup: json['setup'],
        jokePunchline: json['punchline']);
  }
}
