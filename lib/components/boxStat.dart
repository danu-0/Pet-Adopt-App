import 'package:flutter/material.dart';

import '../theme/colour.dart';

class BoxStat extends StatelessWidget {
  final IconData icon;
  final String value;

  const BoxStat({Key? key, required this.icon, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 180,
      decoration: BoxDecoration(
          color: Colour.yellow, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Icon(icon), Text(value)],
      ),
    );
  }
}
