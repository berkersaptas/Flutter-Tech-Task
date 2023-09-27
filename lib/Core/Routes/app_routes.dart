import 'package:auto_route/auto_route.dart';
import '../../Feature/Pokemon_Detail/Screens/pokemon_detail_screen.dart';
import '../../Feature/Pokemon_List/Screens/pokemon_list_screen.dart';
import '../../Feature/Favorite_List/favorite_list_screen.dart';
import '../../Feature/Main/main_screen.dart';

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
            AutoRoute(page: FavoriteListRoute.page),
          ],
        ),
        AutoRoute(page: PokemonDetailRoute.page)
      ];
}
