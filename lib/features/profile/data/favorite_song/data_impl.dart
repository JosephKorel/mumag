import 'package:mumag/features/profile/data/impl.dart';

final class FavoriteSongImpl extends FavoriteRepositoryImpl {
  const FavoriteSongImpl(super._api);

  static const _subPath = 'songs';

  @override
  String get path => '${super.path}/$_subPath';
}
