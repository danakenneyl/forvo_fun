import 'package:flutter/material.dart';
import 'package:forvo_fun/chat.dart';
import 'package:forvo_fun/decks.dart';
import 'package:forvo_fun/read.dart';
import 'package:forvo_fun/stats.dart';


class Menu extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container( 
        color: Theme.of(context).colorScheme.inversePrimary,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 48),
            menuItem(
              text: 'Flashcards', 
              icon: Icons.aod_rounded, 
              onClicked: () => select(context, 0)
              ),
            menuItem(
              text: 'Reading', 
              icon: Icons.book, 
              onClicked: () => select(context, 1)
              ),
            menuItem(
              text: 'Chat', 
              icon: Icons.message,
              onClicked: () => select(context, 2) 
              ),
            menuItem(
              text: 'Stats', 
              icon: Icons.assessment, 
              onClicked: () => select(context, 3)
              ),
            
          ],
        ),
      )
    );
  }
} 

Widget menuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color =  Color.fromARGB(255, 118, 78, 167);
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: const TextStyle(color: color)),
    onTap: onClicked,
  );

}
void select (BuildContext context, int index){
  switch (index) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Decks()
        )
      );
    case 1:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Read()
        )
      );
    case 2:
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Chat()
          )
        );
    case 3:
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Stats()
          )
        );
      break;
    default:
  }
}