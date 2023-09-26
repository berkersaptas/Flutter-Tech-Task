import 'package:flutter/material.dart';
import 'package:pokemonapp/Core/Helpers/static_constants.dart';

class PokemonItem extends StatelessWidget {
  final String name;
  final bool isFavorite;
  final VoidCallback onTapDetail;
  final VoidCallback onTapFavorite;
  const PokemonItem({super.key, required this.name, required this.isFavorite, required this.onTapDetail, required this.onTapFavorite});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTapDetail,
      leading: InkWell(
          onTap: onTapFavorite,
          child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: isFavorite ? AppConstants.clrRedMain : AppConstants.clrGreyMain)),
      title: Text(name),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: AppConstants.icon_size,
      ),
    );
  }
}
