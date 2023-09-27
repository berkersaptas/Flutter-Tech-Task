import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokemonapp/Core/Helpers/static_constants.dart';
import 'package:pokemonapp/Core/Routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../../../Core/Hive/favorite_object.dart';
import '../../../Core/Provider/favorite_manager.dart';

class PokemonItem extends StatelessWidget {
  final String name;
  final String url;
  const PokemonItem({
    super.key,
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        AutoRouter.of(context).push(PokemonDetailRoute(url: url));
      },
      leading: InkWell(
        onTap: () async {
          // create provider (non listener)
          final favoritesProvider =
              Provider.of<FavoriteManager>(context, listen: false);
          // check added favorites list item
          if (favoritesProvider
              .checkContainList(FavoriteObject(name: name, url: url))) {
            // remove list item
            await favoritesProvider
                .removeItem(FavoriteObject(name: name, url: url));
          } else {
            // add list item
            await favoritesProvider
                .addItem(FavoriteObject(name: name, url: url));
          }
        },
        child: Consumer<FavoriteManager>(
          builder: (context, value, child) {
            // check Item In List
            bool checkItemInList =
                value.checkContainList(FavoriteObject(name: name, url: url));
            return Icon(
                checkItemInList ? Icons.favorite : Icons.favorite_border,
                color: checkItemInList
                    ? AppConstants.clrRedMain
                    : AppConstants.clrGreyMain);
          },
        ),
      ),
      title: Text(name),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: AppConstants.icon_size,
      ),
    );
  }
}
