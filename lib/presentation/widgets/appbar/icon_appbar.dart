import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {
  const IconButtonCustom({super.key, this.onPressed, required this.icon});
  final void Function()? onPressed;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: icon, onPressed: onPressed);
  }
}
