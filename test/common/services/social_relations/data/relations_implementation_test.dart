import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/common/services/social_relations/data/relations_implementation.dart';
import 'package:mumag/common/services/social_relations/domain/relations_events.dart';

class ApiMock extends Mock implements ApiRepository {}

void main() {
  const socialRelationsMap = {
    'following': [
      {'id': 1, 'name': 'John', 'avatarUrl': 'johnny'},
    ],
    'followers': [
      {'id': 2, 'name': 'Doe', 'avatarUrl': 'doee'},
    ],
  };

  const socialRelationsParams = GetSocialRelationsEvent(currentUserId: 0);
  final api = ApiMock();
  final socialRelationsImplementation = SocialRelationsImplementation(api);

  group('Tests for relations implementation', () {
    test('Get user followers and following', () async {
      // arrange
      when(
        () => api.get(
          path: 'social/relations',
          query: socialRelationsParams.toMap(),
        ),
      ).thenAnswer((invocation) async => socialRelationsMap);

      // prepare
      final result = await socialRelationsImplementation.getSocialRelations(
        socialRelationParams: socialRelationsParams,
      );

      // assert
      expect(result, isA<UserSocialRelations>());
      expect(result.followers.length, 1);
    });
  });
}
