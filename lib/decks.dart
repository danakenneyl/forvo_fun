import 'package:flutter/material.dart';
import 'package:forvo_fun/deck.dart';
import 'package:forvo_fun/menu.dart';
import 'package:forvo_fun/new_deck.dart';

class Decks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Decks'),
      ),
      body: ElevatedButton(
            child: const Text('Deck #1'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Deck()
                )
              );
            },
          ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewDecks()
            )
          )
        },  
      child: const Icon(Icons.add),
      ),
    );
  }
}