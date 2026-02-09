import 'package:flutter/material.dart';
import 'package:language_learning_app/screens/Ai.dart';
import 'package:language_learning_app/screens/Chats.dart';
import 'package:language_learning_app/screens/Translate.dart';
import 'package:language_learning_app/screens/Addwords.dart';
import 'package:language_learning_app/screens/homepage.dart';


class botnavbar extends StatefulWidget {
  const botnavbar({super.key});

  @override
  State<botnavbar> createState() => _botnavbarState();
}

class _botnavbarState extends State<botnavbar> {
  int index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Myhome(),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: index,
        indicatorColor: Colors.transparent,
        onDestinationSelected: (int newIndex) {
          if (newIndex != 2) {
            Widget targetPage;
            if (newIndex == 0)
              targetPage = const Translate();
            else if (newIndex == 1)
              targetPage = const Ai();
            else if (newIndex == 3)
              targetPage = const AddWords();
            else
              targetPage = const Chats();

            Navigator.of(
              context,
              rootNavigator: true,
            ).push(MaterialPageRoute(builder: (context) => targetPage));
          } else {
            setState(() {
              index = newIndex;
            });
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.translate_outlined, size: 27.0),
            selectedIcon: Icon(Icons.g_translate),
            label: 'Translate',
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_awesome_outlined, size: 27.0),
            selectedIcon: Icon(Icons.auto_awesome),
            label: 'Ai',
          ),
          NavigationDestination(
            icon: Icon(Icons.home_outlined, size: 27.0),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.edit_note_outlined, size: 27.0),
            selectedIcon: Icon(Icons.edit_note),
            label: 'Words',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_outlined, size: 27.0),
            selectedIcon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}