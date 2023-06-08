import 'package:flutter/material.dart';
import 'package:forvo_fun/api_call.dart';
import 'package:forvo_fun/menu.dart';
//import 'package:forvo_fun/new_card.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cards'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NCard()
            )
          )
        },  
      child: const Icon(Icons.add),
      ),
    );
  }
}