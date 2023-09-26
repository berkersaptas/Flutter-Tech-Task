import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemonapp/Core/DataSource/data_source.dart';
import '../Models/pokemon_list_model.dart';

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

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await DataSource().getPokemonList(pageKey, _pageSize);
      final isLastPage = newItems.results!.length < _pageSize;
      //result null check control
      if (newItems.results != null) {
        if (isLastPage) {
          _pagingController.appendLastPage(newItems.results!);
        } else {
          final nextPageKey = pageKey + newItems.results!.length;
          _pagingController.appendPage(
              newItems.results!, int.parse(nextPageKey.toString()));
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
    return Scaffold(
        appBar: AppBar(
          title: const Text("Deneme"),
        ),
        body: PagedListView.separated(
          pagingController: _pagingController,
          padding: const EdgeInsets.all(16),
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
          builderDelegate: PagedChildBuilderDelegate<Results>(
            animateTransitions: true,

            itemBuilder: (context, pokemonList, index) =>
                Text(pokemonList.name!),
            // firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
            //   error: _pagingController.error,
            //   onTryAgain: () => _pagingController.refresh(),
            // ),
            // noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
          ),
        ));
  }
}
