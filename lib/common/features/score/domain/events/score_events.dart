import 'package:mumag/common/features/score/domain/score_entity/score_entity.dart';

sealed class ScoreEvents {}

class AddScore extends ScoreEvents {
  AddScore({required this.score, required this.targetId, required this.type});

  final int score;
  final String targetId;
  final ScoreType type;
}

class EditScore extends ScoreEvents {
  EditScore({required this.scoreId, required this.score});

  final int scoreId;
  final int score;
}

class DeleteScore extends ScoreEvents {
  DeleteScore({required this.scoreId});

  final int scoreId;
}
