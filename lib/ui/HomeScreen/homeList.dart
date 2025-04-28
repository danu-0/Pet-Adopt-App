import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pet_adopted_app/components/categori.dart';
import 'package:pet_adopted_app/components/search.dart';
import 'package:pet_adopted_app/theme/colour.dart';
import 'package:pet_adopted_app/theme/text.dart';

class Homelist extends StatelessWidget {
  const Homelist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchEngine(),
            Gap(12),
            Text(
              'Kategori',
              style: TextApp.h2,
            ),
            Categori(),
            Gap(16),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(),
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colour.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text('Pet ${index + 1}')),
                  );
                },
              ),
            ),
            Gap(13)
          ],
        ),
      ),
    );
  }
}
