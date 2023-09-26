import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemonapp/Core/DataSource/data_source.dart';
import 'package:pokemonapp/Core/Hive/favorite_object.dart';
import 'package:pokemonapp/Core/Provider/favorite_manager.dart';
import 'package:provider/provider.dart';
import '../Widgets/empty_list_indicator.dart';
import '../Widgets/error_indicator.dart';
import '../Models/pokemon_list_model.dart';
import '../Widgets/pokemon_item.dart';

@RoutePage()
class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  static const _pageSize = 20;
  final _pagingController = PagingController<int, Results>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  //Get new or Init Pokemon Data Function
  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await DataSource().getPokemonList(pageKey, _pageSize);
      final isLastPage = newItems.results!.length < _pageSize;
      // data source result null check control
      if (newItems.results != null) {
        if (isLastPage) {
          _pagingController.appendLastPage(newItems.results!);
        } else {
          final nextPageKey = pageKey + newItems.results!.length;
          _pagingController.appendPage(newItems.results!, int.parse(nextPageKey.toString()));
        }
      } else {
        _pagingController.error = "Error";
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  print(Provider.of<FavoriteManager>(context, listen: false).favorites.contains(FavoriteObject(name: pokemonList.name!, url: pokemonList.url!)));
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pokemons"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Badge.count(count: Provider.of<FavoriteManager>(context, listen: true).favorites.length, child: const Icon(Icons.favorite)),
            )
          ],
        ),
        body: PagedListView(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Results>(
            animateTransitions: true,
            itemBuilder: (context, pokemonList, index) => PokemonItem(
              name: pokemonList.name!,
              isFavorite: Provider.of<FavoriteManager>(context, listen: false).checkContainList(FavoriteObject(name: pokemonList.name!, url: pokemonList.url!)),
              onTapDetail: () {
                print("Detail");
              },
              onTapFavorite: () async {
                print("Favorite");
                final favoritesProvider = Provider.of<FavoriteManager>(context, listen: false);
                if (favoritesProvider.checkContainList(FavoriteObject(name: pokemonList.name!, url: pokemonList.url!))) {
                  print("object");
                  await favoritesProvider.removeItem(FavoriteObject(name: pokemonList.name!, url: pokemonList.url!));
                } else {
                  await favoritesProvider.addItem(FavoriteObject(name: pokemonList.name!, url: pokemonList.url!));
                }
              },
            ),
            firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
              onTryAgain: () => _pagingController.refresh(),
            ),
            noItemsFoundIndicatorBuilder: (context) => const EmptyListIndicator(),
          ),
        ));
  }
}
