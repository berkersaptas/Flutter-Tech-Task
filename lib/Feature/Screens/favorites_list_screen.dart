import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FavoritesListScreen extends StatefulWidget {
  const FavoritesListScreen({super.key});

  @override
  State<FavoritesListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoritesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("data2"),
    );
  }
}
