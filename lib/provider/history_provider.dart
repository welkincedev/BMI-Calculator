import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/history_model.dart';
import '../services/shared_pref_service.dart';

class HistoryNotifier extends Notifier<List<HistoryModel>> {
  final SharedPrefService _service = SharedPrefService();
  Future<void>? _activeLoad;

  @override
  List<HistoryModel> build() {
    _activeLoad = null;
    loadHistory();
    return [];
  }

  Future<void> loadHistory() async {
    final Future<void> loadJob = () async {
      final history = await _service.getHistory();
      state = history;
    }();
    _activeLoad = loadJob;
    await loadJob;
    if (_activeLoad == loadJob) {
      _activeLoad = null;
    }
  }

  Future<void> addHistory(HistoryModel history) async {
    await _service.saveHistory(history);
    if (_activeLoad != null) {
      try {
        await _activeLoad;
      } catch (_) {}
    }
    await loadHistory();
  }

  Future<void> clearHistory() async {
    await _service.clearHistory();
    state = [];
  }
}

final historyProvider = NotifierProvider<HistoryNotifier, List<HistoryModel>>(
  HistoryNotifier.new,
);
