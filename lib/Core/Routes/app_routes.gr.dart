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
    FavoritesListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoritesListScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
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
/// [FavoritesListScreen]
class FavoritesListRoute extends PageRouteInfo<void> {
  const FavoritesListRoute({List<PageRouteInfo>? children})
      : super(
          FavoritesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesListRoute';

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
