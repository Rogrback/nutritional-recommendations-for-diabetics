import 'package:flutter/material.dart';
import 'package:tesis_project_v1/widgets/main.dart';

class ListCard extends StatelessWidget {

  final String title;
  final String caloric;
  final String fat;
  final String carbon;
  final String protein;

  const ListCard({
    super.key,
    required this.title,
    required this.caloric,    
    required this.fat,
    required this.carbon,
    required this.protein
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: TitleTextCard(title: title),
        onTap: () {},
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubtitleTextCards(propertyEs: "Calorías", propertyEn: caloric, unit: "kcal."),
            SubtitleTextCards(propertyEs: "Grasas", propertyEn: fat, unit: "gr."),
            SubtitleTextCards(propertyEs: "Carbohidratos", propertyEn: carbon, unit: "gr."),
            SubtitleTextCards(propertyEs: "Proteínas", propertyEn: protein, unit: "gr.")
          ],
        ),
      ),
    );
  }
}