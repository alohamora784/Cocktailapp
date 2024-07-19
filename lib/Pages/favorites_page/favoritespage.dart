import 'package:cocktailapp/Models/cocktails.dart';
import 'package:flutter/material.dart';

class FavortiesPage extends StatefulWidget {
  const FavortiesPage({super.key});

  @override
  State<FavortiesPage> createState() => _FavortiesPageState();
}

class _FavortiesPageState extends State<FavortiesPage> {
  List<Cocktail> _favorites = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink,
        body: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: ListView(
            children: const [
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Favorite Items",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
