import 'package:flutter/material.dart';
import 'package:forvo_fun/menu.dart';

class NewCards extends StatelessWidget {
  const NewCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('New Card'),
      )
    );
  }
}