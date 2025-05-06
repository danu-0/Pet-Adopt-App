import 'package:flutter/material.dart';
import '../theme/colour.dart';
import '../theme/text.dart';

class BoxStat extends StatelessWidget {
  final IconData icon;
  final String value;

  const BoxStat({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: yellow.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: yellow.withOpacity(0.4),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: black),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              value,
              style: TextApp.reguler,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// import '../theme/colour.dart';

// class BoxStat extends StatelessWidget {
//   final IconData icon;
//   final String value;

//   const BoxStat({Key? key, required this.icon, required this.value})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 38,
//       width: 180,
//       decoration: BoxDecoration(
//           color: Colour.yellow, borderRadius: BorderRadius.circular(10)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [Icon(icon), Text(value)],
//       ),
//     );
//   }
// }
