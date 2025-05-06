import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pet_adopted_app/theme/colour.dart';
import 'package:pet_adopted_app/theme/text.dart';

class Categori extends StatefulWidget {
  const Categori({super.key});

  @override
  State<Categori> createState() => _CategoriState();
}

class _CategoriState extends State<Categori> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 12),
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: baseColour, width: 2)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                child: Center(
                  child: Text(
                    'Dog',
                    style: TextW.regulerLink,
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
