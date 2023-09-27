import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokemonapp/Feature/Pokemon_List/Widgets/pokemon_item.dart';
import 'package:provider/provider.dart';
import '../../Core/Provider/favorite_manager.dart';

@RoutePage()
class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: Consumer<FavoriteManager>(builder: (context, value, child) {
        //favorites list empty control
        return value.favorites.isEmpty
            ? const Center(
                child: Text("Favorites is empty"),
              )
            : ListView.builder(
                itemCount: value.favorites.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PokemonItem(
                    name: value.favorites[index].name,
                    url: value.favorites[index].url,
                  );
                });
      }),
    );
  }
}
