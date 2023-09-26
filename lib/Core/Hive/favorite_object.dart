import 'package:hive/hive.dart';
part 'favorite_object.g.dart';

@HiveType(typeId: 0)
class FavoriteObject extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String url;

  FavoriteObject({required this.name, required this.url});

  bool operator ==(other) {
    if (other is String) {
      return other == name || other == url;
    } else {
      return false;
    }
  }
}
