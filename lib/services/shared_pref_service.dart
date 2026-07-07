import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/history_model.dart';

class SharedPrefService {
  static const String historyKey = "bmi_history";

  Future<void> saveHistory(HistoryModel history) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final List<String> historyList =
          prefs.getStringList(historyKey) ?? [];

      historyList.insert(0, history.toJson());

      await prefs.setStringList(historyKey, historyList);
    } catch (e) {
      print("Error saving BMI history: $e");
    }
  }

  Future<List<HistoryModel>> getHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final List<String> historyList =
          prefs.getStringList(historyKey) ?? [];

      final List<HistoryModel> result = [];
      for (final item in historyList) {
        try {
          result.add(HistoryModel.fromJson(item));
        } catch (e) {
          print("Error parsing BMI history item: $e");
        }
      }
      return result;
    } catch (e) {
      print("Error getting BMI history: $e");
      return [];
    }
  }

  Future<void> clearHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.remove(historyKey);
    } catch (e) {
      print("Error clearing BMI history: $e");
    }
  }
}