import 'package:flutter/material.dart';
import 'package:forvo_fun/menu.dart';
import 'package:forvo_fun/new_card.dart';

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cards'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewCards()
            )
          )
        },  
      child: const Icon(Icons.add),
      ),
    );
  }
}