    import 'package:flutter/material.dart';
    import 'package:flutter_riverpod/flutter_riverpod.dart';
    import '../provider/history_provider.dart';
    import '../widgets/empty_history_card.dart';
    import '../widgets/history card.dart';

    class HistoryScreen extends ConsumerWidget {
      const HistoryScreen({super.key});

      @override
      Widget build(BuildContext context, WidgetRef ref) {
        final history = ref.watch(historyProvider);

        return Scaffold(
          backgroundColor: const Color(0xffF4F7FC),

          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "History",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            actions: [
              if (history.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Clear History"),
                        content: const Text(
                          "Are you sure you want to delete all BMI history?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          FilledButton(
                            onPressed: () {
                              ref
                                  .read(historyProvider.notifier)
                                  .clearHistory();

                              Navigator.pop(context);
                            },
                            child: const Text("Clear All"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),

          body: history.isEmpty
              ? const EmptyHistory()
              : ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: history.length,
            itemBuilder: (context, index) {
              final item = history[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: HistoryCard(
                history: item,
              ),
              );
            },
          ),
        );
      }
    }