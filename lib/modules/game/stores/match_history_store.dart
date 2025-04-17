import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import '../../../data/models/match_model.dart';

part 'match_history_store.g.dart';

class MatchHistoryStore = _MatchHistoryStoreBase with _$MatchHistoryStore;

abstract class _MatchHistoryStoreBase with Store {
  late Box<MatchModel> _box;

  @observable
  ObservableList<MatchModel> history = ObservableList<MatchModel>();

  _MatchHistoryStoreBase() {
    _init();
  }

  Future<void> _init() async {
    _box = Hive.box<MatchModel>('matches');
    history.addAll(_box.values.toList().reversed);
  }

  @action
  void addMatch(MatchModel match) {
    _box.add(match);
    history.insert(0, match);
  }

  @action
  void clear() {
    _box.clear();
    history.clear();
  }
}
