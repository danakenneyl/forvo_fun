import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
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
      id: json["id"] ?? 0,
      word: json["word"] ?? "Didn't work 1",
      original: json["original"] ?? "Didn't work 2",
      addtime: json["addtime"] ?? "Didn't work 3",
      hits: json["hits"] ?? 1,
      username: json["username"] ?? "Didn't work 4",
      sex: json["sex"] ?? "Didn't work 5",
      country: json["country"] ?? "Didn't work 6",
      code: json["code"] ?? "Didn't work 7",
      langname: json["langname"] ?? "Didn't work 8",
      pathmp3: json["pathmp3"] ?? "Didn't work 9",
      pathogg: json["pathogg"] ?? "Didn't work 10",
      rate: json["rate"] ?? 2,
      numVotes: json["num_votes"] ?? 3,
      numPositiveVotes: json["num_positive_votes"] ?? 4,
    );
  }
}

Future<List<Album>> fetchAlbum(String word) async {
  final apiKey = 'Nope'; // Replace with your Forvo API key
  final languageCode = 'ko'; 

  final url = Uri.parse('https://apifree.forvo.com/key/$apiKey/format/json/action/word-pronunciations/word/$word/language/$languageCode/limit/1');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final jsonBody = jsonDecode(response.body);
    final items = jsonBody['items'] as List<dynamic>;
    return items.map((item) => Album.fromJson(item)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


class NCard extends StatefulWidget {
  const NCard({super.key});

  @override
  State<NCard> createState() => _NCard();
}

class _NCard extends State<NCard> {
  late Future<List<Album>> futureAlbum;
  late AudioPlayer audioPlayer;
  
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  Future<void> playAudio(String audioUrl) async {
      int result = await audioPlayer.play(audioUrl);
      if (result == 1) {
        // success
        print('Audio playing');
      } else {
        // failure
        print('Failed to play audio');
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Album>>(
            future: fetchAlbum("Hello"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final albums = snapshot.data!;
                return ListView.builder(
                  itemCount: albums.length,
                  itemBuilder: (context, index) {
                    final album = albums[index];
                    return ListTile(
                      title: Text(album.pathmp3),
                      trailing: IconButton(
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () => playAudio(album.pathmp3),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
    );
  }
}