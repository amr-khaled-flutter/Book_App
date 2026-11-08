import 'package:bookly_app/features/spalash/pressentaion/views/widgets/Spalashviewbody.dart';
import 'package:flutter/material.dart';

class Splashview extends StatelessWidget {
  const Splashview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff100B23),
      body: Spalashviewbody(),
    );
  }
}
