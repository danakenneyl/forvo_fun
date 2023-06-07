import 'package:flutter/material.dart';
import 'package:forvo_fun/menu.dart';

class NewDecks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('New Deck'),
      ),
    );
  }
}