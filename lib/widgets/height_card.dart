import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/bmi_provider.dart';

class HeightCard extends ConsumerWidget {
  final double height;

  const HeightCard({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              "Height",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "${height.toInt()} cm",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            Slider(
              value: height,
              min: 120,
              max: 220,
              divisions: 100,
              activeColor: Colors.teal,
              onChanged: (value) {
                ref.read(bmiProvider.notifier).updateHeight(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}