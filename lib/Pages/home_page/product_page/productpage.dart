import 'package:cocktailapp/Models/cocktails.dart';
import 'package:cocktailapp/Providers/cocktails_provider.dart';
import 'package:cocktailapp/Providers/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CocktailPage extends StatefulWidget {
  Cocktail data;
  CocktailPage({super.key, required this.data});

  @override
  State<CocktailPage> createState() => _CocktailPageState();
}

class _CocktailPageState extends State<CocktailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 30, 0, 40),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.red),
                  child: Image.network(
                    widget.data.strDrinkThumb,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_sharp,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<FavoritesProvider>(context,
                                    listen: false)
                                .saveFavorites(widget.data.idDrink);
                          },
                          child: Icon(
                            Icons.favorite_border_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 380),
                    child: Container(
                      width: double.infinity,
                      height: 420,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 30, 0, 40),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data.strDrink,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Category:  " + widget.data.strCategory,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Recipe:  " + widget.data.strInstructions,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                              ),
                            ),
                            Center(
                              child: Text(
                                "Ingredients:  ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                widget.data.strIngredient1.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                widget.data.strIngredient2.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                widget.data.strIngredient3.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                widget.data.strIngredient4.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                widget.data.strIngredient5.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
