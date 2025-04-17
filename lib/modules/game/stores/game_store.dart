import 'package:mobx/mobx.dart';
import '../../../data/models/match_model.dart';
import 'match_history_store.dart';

part 'game_store.g.dart';

class GameStore = _GameStoreBase with _$GameStore;

abstract class _GameStoreBase with Store {
  @observable
  String teamUs = "Nós";

  @observable
  String teamThem = "Eles";

  @observable
  int scoreUs = 0;

  @observable
  int scoreThem = 0;

  @observable
  int maxPoints = 12;

  final MatchHistoryStore _historyStore;

  _GameStoreBase(this._historyStore);

  @action
  void startMatch(String us, String them, int max) {
    teamUs = us;
    teamThem = them;
    maxPoints = max;
    scoreUs = 0;
    scoreThem = 0;
  }

  @action
  void incrementUs() {
    scoreUs++;
    _checkWin();
  }

  @action
  void incrementThem() {
    scoreThem++;
    _checkWin();
  }

  @action
  void reset() {
    scoreUs = 0;
    scoreThem = 0;
  }

  void _checkWin() {
    if (scoreUs >= maxPoints || scoreThem >= maxPoints) {
      _historyStore.addMatch(
        MatchModel(
          teamUs: teamUs,
          teamThem: teamThem,
          scoreUs: scoreUs,
          scoreThem: scoreThem,
          date: DateTime.now(),
        ),
      );
    }
  }
}
