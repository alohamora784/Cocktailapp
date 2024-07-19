import 'package:cocktailapp/Pages/favorites_page/favoritespage.dart';
import 'package:cocktailapp/Pages/home_page/widgets/cocktails_list.dart';
import 'package:cocktailapp/Pages/notes_page/notespage.dart';
import 'package:cocktailapp/Providers/cocktails_provider.dart';
import 'package:cocktailapp/Widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    Provider.of<CocktailProvider>(context, listen: false).fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: Color.fromARGB(255, 30, 0, 40),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.notes_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  const Text(
                    "Choose \n your drink",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  CocktailsGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
