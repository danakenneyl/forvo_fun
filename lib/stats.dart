import 'package:flutter/material.dart';
import 'package:forvo_fun/menu.dart';

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Stats'),
      ),
      
    );
  }
}