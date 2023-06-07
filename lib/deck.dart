import 'package:flutter/material.dart';
import 'package:forvo_fun/cards.dart';
import 'package:forvo_fun/menu.dart';
import 'package:forvo_fun/study.dart';

class Deck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Decks'),
      ),
      body: Row(
        children: <Widget>[
          ElevatedButton(
            child: const Text('Edit'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Cards()
                )
              );
            },
          ),
          ElevatedButton(
            child: const Text('Study Now'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Study()
                )
              );
            },
          ),
        ],
      ),
    );
  }
}