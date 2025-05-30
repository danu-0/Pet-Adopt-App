import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pet_adopted_app/theme/colour.dart';
import 'package:pet_adopted_app/theme/text.dart';

class buton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const buton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 51,
        decoration: BoxDecoration(
          color: baseColour,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: white, fontSize: 16, fontWeight: semiBold),
          ),
        ),
      ),
    );
  }
}

class butonS extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String image;

  const butonS(
      {required this.onPressed, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 51,
        decoration: BoxDecoration(
          color: baseColour,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(image)),
            Gap(10),
            Text(
              text,
              style: TextStyle(color: white, fontSize: 16, fontWeight: regular),
            ),
          ],
        ),
      ),
    );
  }
}
