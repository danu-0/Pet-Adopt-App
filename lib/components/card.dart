import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../theme/colour.dart';
import '../theme/text.dart';

class card extends StatelessWidget {
  final String gambar;
  final String petName;
  final String location;
  final String kategory;

  const card({
    super.key,
    required this.gambar,
    required this.petName,
    required this.location,
    required this.kategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: baseColour,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                gambar,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image, size: 40),
              ),
            ),
          ),
          Gap(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                petName,
                style: TextW.reguler,
              ),
              Text(
                kategory,
                style: TextW.reguler,
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: white),
              Flexible(
                child: Text(
                  location,
                  style: TextW.regulerS,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
