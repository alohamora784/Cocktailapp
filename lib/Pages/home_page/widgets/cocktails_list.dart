import 'package:cocktailapp/Models/cocktails.dart';
import 'package:cocktailapp/Pages/home_page/product_page/productpage.dart';
import 'package:cocktailapp/Providers/cocktails_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CocktailsGrid extends StatefulWidget {
  const CocktailsGrid({super.key});

  @override
  State<CocktailsGrid> createState() => _CocktailsGridState();
}

class _CocktailsGridState extends State<CocktailsGrid> {
  final ScrollController _scrollController = ScrollController();
  late CocktailProvider _provider;
  void initState() {
    super.initState();
    _provider = CocktailProvider(); // Initialize your provider
    _scrollController.addListener(_scrollListener);
    _provider.fetchdata(); // Initial fetch
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _provider.fetchdata(); // Fetch more when scrolled to the bottom
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CocktailProvider>(builder: (_, provider, __) {
      final List<Cocktail> cocktails = provider.cocktails;
      return SingleChildScrollView(
        child: GridView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: cocktails.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CocktailPage(data: cocktails[index],)),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Image.network(
                        cocktails[index].strDrinkThumb,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Text(
                          cocktails[index].strDrink,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
