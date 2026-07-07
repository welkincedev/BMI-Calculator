import 'dart:convert';

class HistoryModel {
  final double bmi;
  final String category;
  final double height;
  final int weight;
  final String date;

  HistoryModel({
    required this.bmi,
    required this.category,
    required this.height,
    required this.weight,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'bmi': bmi,
      'category': category,
      'height': height,
      'weight': weight,
      'date': date,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      bmi: (map['bmi'] as num).toDouble(),
      category: map['category'] as String,
      height: (map['height'] as num).toDouble(),
      weight: map['weight'] as int,
      date: map['date'] as String,
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory HistoryModel.fromJson(String source) {
    return HistoryModel.fromMap(
      jsonDecode(source) as Map<String, dynamic>,
    );
  }
}