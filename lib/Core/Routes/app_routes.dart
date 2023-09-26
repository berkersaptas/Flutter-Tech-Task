import 'package:auto_route/auto_route.dart';
import '../../Feature/Pokemon_List/Screens/pokemon_list_screen.dart';
import '../../Feature/Screens/favorites_list_screen.dart';
import '../../Feature/Screens/main_screen.dart';

part 'app_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          children: [
            AutoRoute(page: PokemonListRoute.page),
            AutoRoute(page: FavoritesListRoute.page),
          ],
        ),
      ];
}
