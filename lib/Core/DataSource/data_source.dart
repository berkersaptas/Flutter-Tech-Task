import 'package:pokemonapp/Core/Helpers/static_constants.dart';
import 'package:pokemonapp/Feature/Pokemon_List/Models/pokemon_list_model.dart';
import 'package:dio/dio.dart';

class DataSource {
  final Dio client = Dio()..options.baseUrl = AppConstants.base_url;

  Future<PokemonListModel> getPokemonList(pageKey, pageSize) async {
    final res = await client.get("pokemon?offset=$pageKey&limit=$pageSize");
    final data = res.data;
    return PokemonListModel.fromJson(data);
  }

  Future<PokemonListModel> getInitPokemonList() async {
    final res = await client.get("pokemon");
    final data = res.data;
    return PokemonListModel.fromJson(data);
  }

  Future<PokemonListModel> getNextPokemonList(String url) async {
    final res = await Dio().get(url);
    final data = res.data;
    return PokemonListModel.fromJson(data);
  }
}
