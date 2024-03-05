base class FavoriteDataParams {
  const FavoriteDataParams({required this.authorId, this.path});

  final int authorId;
  final String? path;

  Map<String, dynamic> toMap() => {'authorId': authorId};
}

final class GetUserFavoriteTitlesParams extends FavoriteDataParams {
  const GetUserFavoriteTitlesParams({required super.authorId});
}

final class UpdateTitleParams extends FavoriteDataParams {
  const UpdateTitleParams({
    required super.authorId,
    required this.title,
    required super.path,
  });

  final String title;

  @override
  Map<String, dynamic> toMap() => {...super.toMap(), 'title': title};
}

final class LikeTitleParams extends FavoriteDataParams {
  const LikeTitleParams({
    required super.authorId,
    required this.userId,
    required super.path,
  });

  final int userId;

  @override
  Map<String, dynamic> toMap() => {...super.toMap(), 'userId': userId};
}
