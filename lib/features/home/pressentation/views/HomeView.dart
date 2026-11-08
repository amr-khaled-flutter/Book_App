import 'package:bookly_app/features/home/pressentation/views/widget/Homeviewbody.dart';
import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Homeviewbody()));
  }
}
