import 'package:flutter/material.dart';

class ColorsItem extends StatelessWidget {
  const ColorsItem({
    Key? key,
    required this.isActive,
    required this.color,
  }) : super(key: key);
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 37,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 33,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 37,
          );
  }
}
