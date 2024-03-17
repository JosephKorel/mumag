base class FavoriteParams {
  const FavoriteParams({
    required this.userId,
    required this.subPath,
  });
  final int userId;
  final String subPath;

  Map<String, dynamic> toMap() => {'userId': userId};

  FavoriteParams addData(List<Map<String, dynamic>> items) =>
      throw UnimplementedError();
}

final class GetFavoriteParams extends FavoriteParams {
  const GetFavoriteParams({
    required super.userId,
    required super.subPath,
  });
}

final class CreateFavoriteParams extends FavoriteParams {
  const CreateFavoriteParams({
    required super.userId,
    required super.subPath,
    required this.data,
  });

  factory CreateFavoriteParams.songs({required int userId}) =>
      CreateFavoriteParams(userId: userId, subPath: _songsPath, data: []);

  static const _songsPath = '/songs';

  final List<Map<String, dynamic>> data;

  @override
  Map<String, dynamic> toMap() => {...super.toMap(), 'data': data};

  @override
  CreateFavoriteParams addData(List<Map<String, dynamic>> items) =>
      CreateFavoriteParams(
        userId: userId,
        subPath: subPath,
        data: items,
      );
}
