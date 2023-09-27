import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokemonapp/Core/DataSource/data_source.dart';
import 'package:pokemonapp/Core/Extensions/extensions.dart';
import 'package:pokemonapp/Core/Helpers/static_constants.dart';
import 'package:pokemonapp/Feature/Pokemon_Detail/Models/pokemon_detail_model.dart';

@RoutePage()
class PokemonDetailScreen extends StatefulWidget {
  final String url;
  const PokemonDetailScreen({super.key, required this.url});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  late Future<PokemonDetailModel> _pokemonDetailApi;

  @override
  void initState() {
    _pokemonDetailApi = DataSource().getPokemonDetail(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<PokemonDetailModel>(
          future: _pokemonDetailApi,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // print(
              //     snapshot.data?.sprites?.other?.officialArtwork?.frontDefault);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.network(
                    //   snapshot
                    //       .data!.sprites!.other!.officialArtwork!.frontDefault!,
                    //   height: MediaQuery.of(context).size.height / 3,
                    //   width: MediaQuery.of(context).size.width,
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      snapshot.data!.name!,
                      style: _titleTextStyle(),
                    ),
                    Text(
                        "#${snapshot.data!.id!.addLeadingZeros(4).toString()}"),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Type",
                      style: _titleTextStyle(),
                    ),
                    Row(
                        children: List.generate(
                            snapshot.data!.types!.length,
                            (index) => IntrinsicHeight(
                                    child: Row(children: [
                                  Text(
                                      snapshot.data!.types![index].type!.name!),
                                  //Last item after not seen divider
                                  index + 1 < snapshot.data!.types!.length
                                      ? const VerticalDivider(
                                          color: Colors.black,
                                          thickness: 1,
                                          width: 20,
                                        )
                                      : const SizedBox.shrink(),
                                ])))),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Ability",
                      style: _titleTextStyle(),
                    ),
                    Row(
                        children: List.generate(
                            snapshot.data!.abilities!.length,
                            (index) => IntrinsicHeight(
                                    child: Row(children: [
                                  Text(snapshot
                                      .data!.abilities![index].ability!.name!),
                                  //Last item after not seen divider
                                  index + 1 < snapshot.data!.abilities!.length
                                      ? const VerticalDivider(
                                          color: Colors.black,
                                          thickness: 1,
                                          width: 20,
                                        )
                                      : const SizedBox.shrink(),
                                ])))),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Height",
                      style: _titleTextStyle(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Height",
                      style: _titleTextStyle(),
                    ),
                    Text(snapshot.data!.height!.toString()),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Weight",
                      style: _titleTextStyle(),
                    ),
                    Text(snapshot.data!.weight!.toString()),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Network request error"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  String _heightCalculator() {
    return "";
  }

  String _weightCalculator() {
    return "";
  }

  TextStyle _titleTextStyle() {
    return const TextStyle(
        fontWeight: FontWeight.bold, fontSize: AppConstants.large_font);
  }
}
