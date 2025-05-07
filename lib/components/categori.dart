import 'package:flutter/material.dart';
import '/theme/colour.dart';
import '/theme/text.dart';

class Categori extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onSelectedCategory;

  const Categori({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final cat = categories[index];
            final isSelected = cat == selectedCategory;

            return GestureDetector(
              onTap: () => onSelectedCategory(cat),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isSelected ? baseColour : Colors.transparent,
                  border: Border.all(
                      color: isSelected ? baseColour : baseColour, width: 2),
                ),
                child: Center(
                  child: Text(
                    cat,
                    style: isSelected
                        ? TextW.regulerLink.copyWith(color: white)
                        : TextW.regulerLink,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
