import 'package:flutter/material.dart';

import '../model/history_model.dart';

class HistoryCard extends StatelessWidget {
  final HistoryModel history;

  const HistoryCard({
    super.key,
    required this.history,
  });

  Color getColor() {
    switch (history.category) {
      case "Normal":
        return Colors.green;
      case "Underweight":
        return Colors.orange;
      case "Overweight":
        return Colors.deepOrange;
      case "Obese":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: getColor(),
              child: Text(
                history.bmi.toStringAsFixed(1),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    history.category,
                    style: TextStyle(
                      color: getColor(),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "Height : ${history.height.toInt()} cm",
                    style: const TextStyle(fontSize: 15),
                  ),

                  Text(
                    "Weight : ${history.weight} kg",
                    style: const TextStyle(fontSize: 15),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    history.date,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}