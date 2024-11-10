import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/provider/topic_provider.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  /// Chips topics
  final List<String> topics = const [
    '🏈   Sports',
    '⚖️   Politics',
    '🌞   Life',
    '🎮   Gaming',
    '🐻   Animals',
    '🌴   Nature',
    '🍔   Food',
    '🎨   Art',
    '📜   History',
    '👗   Fashion',
    '😷   Covid-19',
    '⚔️   Middle East',
  ];

  @override
  Widget build(BuildContext context) {
    /// topic provider
    final topicsProvider = Provider.of<TopicsProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select your favorite topics",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppColors.titleTextColor,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Select some of your favorite topics to let us suggest better news for you.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.subTitleTextColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: topics.map((topic) {
                  final isSelected = topicsProvider.isSelected(topic);
                  return ChoiceChip(
                    label: Text(
                      topic,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: Colors.blue,
                    checkmarkColor: Colors.white,
                    // Set tick color to white
                    onSelected: (bool selected) {
                      topicsProvider.toggleTopicSelection(topic);
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
