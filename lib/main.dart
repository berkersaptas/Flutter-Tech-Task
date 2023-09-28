import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemonapp/Core/Helpers/static_constants.dart';
import 'package:pokemonapp/Core/Hive/favorite_object.dart';
import 'package:pokemonapp/Core/Provider/favorite_manager.dart';
import 'package:provider/provider.dart';
import 'Core/Routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter("pokemonapp");
  Hive.registerAdapter<FavoriteObject>(FavoriteObjectAdapter());
  await Hive.openBox<FavoriteObject>("favorites");
  //Set Portrait Up and PortraitDown
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final Box<FavoriteObject> favorites = Hive.box<FavoriteObject>("favorites");
    return ChangeNotifierProvider<FavoriteManager>(
        //Checking that the favorite list is empty on the first load and when exiting without adding it to the favorites, and checking that the list is fetched from local storage if it is full.
        create: (context) => favorites.isEmpty ? FavoriteManager([]) : FavoriteManager(favorites.values.toList()),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppConstants.strAppName,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.clrRedMain),
          ),
          darkTheme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: AppConstants.clrRedMain)),
          routerConfig: _appRouter.config(),
        ));
  }
}
