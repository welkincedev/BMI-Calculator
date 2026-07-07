import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final double bmi;
  final String category;

  const ResultCard({
    super.key,
    required this.bmi,
    required this.category,
  });

  Color getCategoryColor() {
    if (category == "Normal") {
      return Colors.green;
    } else if (category == "Underweight") {
      return Colors.orange;
    } else if (category == "Overweight") {
      return Colors.deepOrange;
    } else if (category == "Obese") {
      return Colors.red;
    }

    return Colors.grey;
  }

  IconData getCategoryIcon() {
    if (category == "Normal") {
      return Icons.favorite;
    } else if (category == "Underweight") {
      return Icons.trending_down;
    } else if (category == "Overweight") {
      return Icons.trending_up;
    } else if (category == "Obese") {
      return Icons.warning_amber_rounded;
    }

    return Icons.monitor_weight_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff0F766E),
            Color(0xff20b6a6),
            Color(0xff14B8A6)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: bmi == 0
          ? const Column(
        children: [
          Icon(
            Icons.add_card,
            color: Colors.white,
            size: 60,
          ),
          SizedBox(height: 15),
          Text(
            "Calculate your BMI",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Your result will appear here.",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      )
          : Column(
        children: [
          const Text(
            "Your BMI",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            bmi.toStringAsFixed(1),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  getCategoryIcon(),
                  color: getCategoryColor(),
                ),
                const SizedBox(width: 8),
                Text(
                  category,
                  style: TextStyle(
                    color: getCategoryColor(),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}