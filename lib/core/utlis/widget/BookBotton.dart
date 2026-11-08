import 'package:bookly_app/core/utlis/Styles.dart';
import 'package:flutter/material.dart';

class Bookbotton extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  final Color colortext;
  final String text;
  final BorderRadiusGeometry? borderRadius;
  const Bookbotton({
    super.key,
    required this.color,
    required this.text,
    this.borderRadius,
    required this.colortext,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(0, 48),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.textStyle18.copyWith(
          color: colortext,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
