import 'package:flutter/material.dart';

import 'custom_icon_search.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.text,
    required this.icon,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          const Spacer(),
          CuctomSearchIcon(
            icon: icon,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class CustomAppBarEdit extends StatelessWidget {
  const CustomAppBarEdit({
    Key? key,
    required this.text,
    required this.icon,
    required this.iconBack,
    this.onPressedBack,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final void Function()? onPressed;
  final IconData iconBack;
  final void Function()? onPressedBack;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          CuctomSearchIcon(
            icon: iconBack,
            onPressed: onPressedBack,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 20,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          const Spacer(),
          CuctomSearchIcon(
            icon: icon,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
