import 'package:bookly_app/core/utlis/Styles.dart';
import 'package:flutter/material.dart';

class Customerrormessage extends StatelessWidget {
  final String eroor;
  const Customerrormessage({required this.eroor});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(
      textAlign: TextAlign.center,
      eroor, style: Styles.textStyle18));
  }
}
