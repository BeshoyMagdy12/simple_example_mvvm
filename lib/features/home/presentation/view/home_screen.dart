import 'package:breaking_bad_mvvm/features/characters/presentation/view/widget/charactersscreenbody.dart';
import 'package:breaking_bad_mvvm/features/characters/presentation/view/widget/episode_screen_body.dart';
import 'package:breaking_bad_mvvm/features/characters/presentation/view/widget/location_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    const CharactersScreenBody(),
    const EpisodeScreenBody(),
    const LocationScreenBody(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 7,
        items:const [

          BottomNavigationBarItem(icon: Icon(Icons.groups),label:'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.playlist_add_check),label:'Episode'),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin_circle),label:'Location'),
        ],
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex=value;
          });
        },
      ),
      body: screens.elementAt(currentIndex),
    );
  }
}
