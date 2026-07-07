class BMIModel {
  final double height;
  final int weight;
  final double bmi;
  final String category;

  const BMIModel({
    required this.height,
    required this.weight,
    required this.bmi,
    required this.category,
  });

  BMIModel copyWith({
    double? height,
    int? weight,
    double? bmi,
    String? category,
  }) {
    return BMIModel(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      bmi: bmi ?? this.bmi,
      category: category ?? this.category,
    );
  }
}