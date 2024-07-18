import 'package:cocktailapp/Pages/favorites_page/favoritespage.dart';
import 'package:cocktailapp/Pages/home_page/homepage.dart';
import 'package:cocktailapp/Pages/notes_page/notespage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRoutersetup extends StatefulWidget {
  const GoRoutersetup({super.key});

  @override
  State<GoRoutersetup> createState() => _GoRoutersetupState();
}

class _GoRoutersetupState extends State<GoRoutersetup> {
  final GoRouter _router = GoRouter(
    initialLocation: "Home",
    routes: [
      GoRoute(
        path: "Home",
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: "Favorites",
        builder: (context, state) => const FavortiesPage(),
      ),
      GoRoute(
        path: "Notes",
        builder: (context, state) => const NotesPage(),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
