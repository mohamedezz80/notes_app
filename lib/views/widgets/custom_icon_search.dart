import 'package:flutter/material.dart';
import 'package:notes_app/const/colors.dart';

class CuctomSearchIcon extends StatelessWidget {
  const CuctomSearchIcon({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    return Container(
      height: hieght / 20,
      width: hieght / 20,
      decoration: BoxDecoration(
        color: AppColor.kWhite.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 25,
        ),
      ),
    );
  }
}
