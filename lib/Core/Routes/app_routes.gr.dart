// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FavoriteListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoriteListScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    PokemonDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PokemonDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PokemonDetailScreen(
          url: args.url,
        ),
      );
    },
    PokemonListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PokemonListScreen(),
      );
    },
  };
}

/// generated route for
/// [FavoriteListScreen]
class FavoriteListRoute extends PageRouteInfo<void> {
  const FavoriteListRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PokemonDetailScreen]
class PokemonDetailRoute extends PageRouteInfo<PokemonDetailRouteArgs> {
  PokemonDetailRoute({
    required String url,
    List<PageRouteInfo>? children,
  }) : super(
          PokemonDetailRoute.name,
          args: PokemonDetailRouteArgs(
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'PokemonDetailRoute';

  static const PageInfo<PokemonDetailRouteArgs> page =
      PageInfo<PokemonDetailRouteArgs>(name);
}

class PokemonDetailRouteArgs {
  const PokemonDetailRouteArgs({
    required this.url,
  });

  final String url;

  @override
  String toString() {
    return 'PokemonDetailRouteArgs{key: , url: $url}';
  }
}

/// generated route for
/// [PokemonListScreen]
class PokemonListRoute extends PageRouteInfo<void> {
  const PokemonListRoute({List<PageRouteInfo>? children})
      : super(
          PokemonListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PokemonListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
