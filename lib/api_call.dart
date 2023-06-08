import 'dart:convert';
//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Album {

  final int id;
  final String word;
  final String original;
  final String addtime;
  final int hits;
  final String username;
  final String sex;
  final String country;
  final String code;
  final String langname;
  final String pathmp3;
  final String pathogg;
  final int rate;
  final int numVotes;
  final int numPositiveVotes;

  const Album({
    required this.id,
    required this.word,
    required this.original,
    required this.addtime,
    required this.hits,
    required this.username,
    required this.sex,
    required this.country,
    required this.code,
    required this.langname,
    required this.pathmp3,
    required this.pathogg,
    required this.rate,
    required this.numVotes,
    required this.numPositiveVotes
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json["id"],
      word: json["word"],
      original: json["original"],
      addtime: json["addtime"],
      hits: json["hits"],
      username: json["username"],
      sex: json["sex"],
      country: json["country"],
      code: json["code"],
      langname: json["langname"],
      pathmp3: json["pathmp3"],
      pathogg: json["pathogg"],
      rate: json["rate"],
      numVotes: json["num_votes"],
      numPositiveVotes: json["num_positive_votes"],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}