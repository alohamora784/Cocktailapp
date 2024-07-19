import 'package:cocktailapp/Pages/favorites_page/favoritespage.dart';
import 'package:cocktailapp/Pages/home_page/homepage.dart';
import 'package:cocktailapp/Pages/notes_page/notespage.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  final List<Widget> _pages = [
    const MainPage(),
    const FavortiesPage(),
     NotesPage(),
  ];

  void navigatepage(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: selectedIndex,
            children: _pages,
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(top: 750, left: 30, right: 30),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(),
                  child: BottomNavigationBar(
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: 'Favorites',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.note),
                        label: 'Notes',
                      ),
                    ],
                    currentIndex: selectedIndex,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.black,
                    onTap: navigatepage,
                    backgroundColor: Color.fromARGB(255, 212, 61, 239).withOpacity(0.9),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
