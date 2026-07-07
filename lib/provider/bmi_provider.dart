import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/bmi_model.dart';
import '../model/history_model.dart';
import 'history_provider.dart';

class BMINotifier extends Notifier<BMIModel> {
  @override
  BMIModel build() {
    return const BMIModel(
      height: 170,
      weight: 65,
      bmi: 0,
      category: '',
    );
  }

  void updateHeight(double value) {
    state = state.copyWith(height: value);
  }

  void increaseWeight() {
    state = state.copyWith(weight: state.weight + 1);
  }

  void decreaseWeight() {
    if (state.weight > 1) {
      state = state.copyWith(weight: state.weight - 1);
    }
  }

  void calculateBMI() {
    final heightInMeter = state.height / 100;

    final bmi = state.weight / (heightInMeter * heightInMeter);

    String category;

    if (bmi < 18.5) {
      category = "Underweight";
    } else if (bmi < 25) {
      category = "Normal";
    } else if (bmi < 30) {
      category = "Overweight";
    } else {
      category = "Obese";
    }


    state = state.copyWith(
      bmi: bmi,
      category: category,
    );

    final history = HistoryModel(
      bmi: bmi,
      category: category,
      height: state.height,
      weight: state.weight,
      date: DateTime.now().toString(),
    );

    ref.read(historyProvider.notifier).addHistory(history);
  }

  void reset() {
    state = build();
  }
}

final bmiProvider =
NotifierProvider<BMINotifier, BMIModel>(BMINotifier.new);